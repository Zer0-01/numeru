import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:numeru/presentation/common_widgets/app_app_bar_widget.dart';
import 'package:numeru/presentation/screen/home/widgets/feature_grid_widget.dart';
import 'package:numeru/presentation/screen/home/widgets/greet_widget.dart';
import 'package:numeru/router/app_router.gr.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget(
        title: "Numeru",
        actions: [
          IconButton(
            onPressed: () {
              context.router.push(const SettingsSetupRoute());
            },
            icon: const Icon(Icons.settings_outlined),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [GreetWidget(), FeatureGridWidget()],
        ),
      ),
    );
  }
}
