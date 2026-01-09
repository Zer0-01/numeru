import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/presentation/screen/home/widgets/feature_grid_widget.dart';
import 'package:numeru/presentation/screen/home/widgets/search_text_field_widget.dart';
import 'package:numeru/router/app_router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.router.push(SettingsSetupRoute()),
            icon: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.settings_outlined),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [SearchTextFieldWidget(), FeatureGridWidget()],
      ),
    );
  }
}
