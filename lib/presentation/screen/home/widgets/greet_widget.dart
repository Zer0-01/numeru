import 'package:flutter/material.dart';
import 'package:numeru/constant/sizes_constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_hero_widget.dart';

class GreetWidget extends StatelessWidget {
  const GreetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.hello_with_exclamation,
            style: context.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            context.l10n.what_can_i_help_you_solve,
            style: context.textTheme.titleMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          SizedBox(
            height: SizesConstant.heightPercentage(context, 20),
            child: AppHeroWidget(
              imageUrl:
                  "https://images.pexels.com/photos/128867/coins-currency-investment-insurance-128867.jpeg",
              title: context.l10n.split_your_bill_fairly,
              label: context.l10n.daily_insight.toUpperCase(),
            ),
          ),
        ],
      ),
    );
  }
}
