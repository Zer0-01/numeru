import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numeru/constant/padding_constant.dart';
import 'package:numeru/constant/sizes_constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/screen/split/bloc/split_bloc.dart';
import 'package:numeru/util/common_functions.dart';

class WhoIsPayingWidget extends StatelessWidget {
  const WhoIsPayingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplitBloc, SplitState>(
      builder: (context, state) {
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

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    spacing: 12,
                    children: [
                      ...state.peopleModel.map(
                        (people) => TweenAnimationBuilder<double>(
                          key: ValueKey(people.id),
                          tween: Tween(begin: 0.0, end: 1.0),
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOutBack,
                          builder: (context, value, child) {
                            return Transform.scale(scale: value, child: child);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
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
                                      color: getAvatarColor(
                                        people.id,
                                      ).withValues(alpha: 0.8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(
                                            alpha: 0.05,
                                          ),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                      child: Text(
                                        getInitials(people.name),
                                        style: context.textTheme.titleSmall
                                            ?.copyWith(
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
                                          OnRemovePeopleEvent(people.id),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.error,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color:
                                                context.colorScheme.onPrimary,
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
                                people.name,
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
                              width: SizesConstant.widthPercentage(context, 14),
                              height: SizesConstant.widthPercentage(
                                context,
                                14,
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.surfaceContainerLow,
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
    );
  }
}
