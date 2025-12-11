import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/constant/constant.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/router/app_router.gr.dart';
import 'package:numeru/util/common_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String _getFeatureTitle(String feature) {
    switch (feature) {
      case FeatureConstant.split:
        return 'Split';
      default:
        return "Coming Soon";
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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 4.0,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                isDense: true,
                fillColor: context.colorScheme.primaryContainer,
                hintText: "Search tools...",
                hintStyle: TextStyle(
                  color: context.colorScheme.onPrimaryContainer,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: context.colorScheme.primary),
                ),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Padding(
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
                            _getFeatureTitle(feature.name),
                            style: TextStyle(),
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
          ),
        ],
      ),
    );
  }
}
