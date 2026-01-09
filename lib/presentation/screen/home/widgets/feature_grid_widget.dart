import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/constant/constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/l10n/app_localizations.dart';
import 'package:numeru/router/app_router.gr.dart';
import 'package:numeru/util/common_functions.dart';

class FeatureGridWidget extends StatelessWidget {
  const FeatureGridWidget({super.key});

  String _getFeatureTitle(BuildContext context, String feature) {
    switch (feature) {
      case FeatureConstant.split:
        return 'Split';
      default:
        return AppLocalizations.of(context)!.coming_soon;
    }
  }

  String _getFeatureDescription(BuildContext context, String feature) {
    switch (feature) {
      case FeatureConstant.split:
        return 'Divide checks and tax';
      default:
        return AppLocalizations.of(context)!.coming_soon;
    }
  }

  void Function()? _getoOnTapFeature(BuildContext context, String feature) {
    switch (feature) {
      case FeatureConstant.split:
        return () => AutoRouter.of(context).push(const SplitSetupRoute());
      default:
        return () =>
            showErrorToast(context, "Feature Not Available", "Coming Soon");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
      child: Column(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.l10n.quick_tools,
            style: context.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: FeatureEnum.values.length,
            itemBuilder: (context, index) {
              final feature = FeatureEnum.values[index];

              return Material(
                borderRadius: BorderRadius.circular(12),
                color: context.colorScheme.surfaceContainerLowest,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: _getoOnTapFeature(context, feature.name),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.colorScheme.primary,
                            ),
                            child: Icon(
                              feature.icon,
                              color: context.colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _getFeatureTitle(context, feature.name),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: context.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                _getFeatureDescription(context, feature.name),
                                style: context.textTheme.labelLarge?.copyWith(
                                  color: context.colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
