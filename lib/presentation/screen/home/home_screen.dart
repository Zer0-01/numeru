import 'package:flutter/material.dart';
import 'package:numeru/presentation/screen/home/widgets/feature_grid_widget.dart';
import 'package:numeru/presentation/screen/home/widgets/search_text_field_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        children: [SearchTextFieldWidget(), FeatureGridWidget()],
      ),
    );
  }
}
