import 'package:flutter/material.dart';
import 'package:numeru/presentation/screen/split/widgets/person_widget.dart';

class SplitScreen extends StatelessWidget {
  const SplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Split"), centerTitle: true, elevation: 2),
      body: CustomScrollView(slivers: [PersonWidget()]),
    );
  }
}
