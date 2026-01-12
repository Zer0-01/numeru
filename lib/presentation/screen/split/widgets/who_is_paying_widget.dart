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
                    spacing: 8,
                    children: [
                      ...state.peopleModel.map(
                        (people) => Column(
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
                                  15,
                                ),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getAvatarColor(people.id),
                                ),
                                child: Center(
                                  child: Text(getInitials(people.name)),
                                ),
                              ),
                            ),
                            Text(
                              people.name,
                              style: context.textTheme.labelMedium?.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
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
                              width: SizesConstant.widthPercentage(context, 15),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: context.colorScheme.surfaceContainer,
                                ),
                              ),
                              child: const Center(child: Text("+")),
                            ),
                          ),
                          Text(
                            "Add",
                            style: context.textTheme.labelMedium?.copyWith(
                              color: context.colorScheme.onSurfaceVariant,
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
