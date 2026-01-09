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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: FeatureEnum.values.length,
        itemBuilder: (context, index) {
          final feature = FeatureEnum.values[index];

          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: _getoOnTapFeature(context, feature.name),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: context.colorScheme.surfaceContainerLowest,
              ),
              child: Column(
                spacing: 8,
                children: [
                  Expanded(
                    child: Icon(
                      feature.icon,
                      color: context.colorScheme.primary,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      _getFeatureTitle(context, feature.name),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
}
