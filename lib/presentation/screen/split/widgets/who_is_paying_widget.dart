import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/constant/padding_constant.dart';
import 'package:numeru/constant/sizes_constant.dart';
import 'package:numeru/data/models/person_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/util/common_functions.dart';

class WhoIsPayingWidget extends StatefulWidget {
  const WhoIsPayingWidget({super.key});

  @override
  State<WhoIsPayingWidget> createState() => _WhoIsPayingWidgetState();
}

class _WhoIsPayingWidgetState extends State<WhoIsPayingWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  final List<PersonModel> _people = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplitBloc, SplitState>(
      listenWhen:
          (previous, current) => previous.peopleModel != current.peopleModel,
      listener: (context, state) {
        final newPeople = state.peopleModel;

        // Handle removals
        for (int i = _people.length - 1; i >= 0; i--) {
          final person = _people[i];
          if (!newPeople.any((p) => p.id == person.id)) {
            final removedPerson = _people.removeAt(i);
            _listKey.currentState?.removeItem(
              i,
              (context, animation) =>
                  _buildPersonItem(removedPerson, animation),
              duration: const Duration(milliseconds: 300),
            );
          }
        }

        // Handle additions
        for (int i = 0; i < newPeople.length; i++) {
          final person = newPeople[i];
          if (!_people.any((p) => p.id == person.id)) {
            _people.insert(i, person);
            _listKey.currentState?.insertItem(
              i,
              duration: const Duration(milliseconds: 300),
            );
          }
        }
      },
      child: BlocBuilder<SplitBloc, SplitState>(
        buildWhen:
            (previous, current) => false, // We handle updates via listKey
        builder: (context, state) {
          // Initialize list if it's empty but state has people
          if (_people.isEmpty && state.peopleModel.isNotEmpty) {
            _people.addAll(state.peopleModel);
          }

          return SliverPadding(
            padding: PaddingConstant.bottom(bottom: 8, others: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Who is paying?",
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: SizesConstant.widthPercentage(context, 14) + 30,
                    child: Row(
                      children: [
                        Expanded(
                          child: AnimatedList(
                            key: _listKey,
                            scrollDirection: Axis.horizontal,
                            initialItemCount: _people.length,
                            itemBuilder: (context, index, animation) {
                              return _buildPersonItem(
                                _people[index],
                                animation,
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                context.read<SplitBloc>().add(
                                  const OnAddPeopleEvent(),
                                );
                              },
                              child: Container(
                                width: SizesConstant.widthPercentage(
                                  context,
                                  14,
                                ),
                                height: SizesConstant.widthPercentage(
                                  context,
                                  14,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      context.colorScheme.surfaceContainerLow,
                                  border: Border.all(
                                    color: context.colorScheme.outlineVariant,
                                    width: 1,
                                  ),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add_rounded,
                                    size: 20,
                                    color: context.colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Add",
                              style: context.textTheme.labelMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPersonItem(PersonModel person, Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: CurvedAnimation(parent: animation, curve: Curves.easeOutBack),
        child: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: SizesConstant.widthPercentage(context, 14),
                    height: SizesConstant.widthPercentage(context, 14),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: getAvatarColor(person.id).withValues(alpha: 0.8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        getInitials(person.name),
                        style: context.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: -2,
                    top: -2,
                    child: GestureDetector(
                      onTap: () {
                        context.read<SplitBloc>().add(
                          OnRemovePeopleEvent(person.id),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          color: context.colorScheme.error,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: context.colorScheme.onPrimary,
                            width: 1.5,
                          ),
                        ),
                        child: Icon(
                          Icons.close_rounded,
                          size: 10,
                          color: context.colorScheme.onError,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                person.name,
                style: context.textTheme.labelMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
