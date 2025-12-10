import 'package:flutter/material.dart';
import 'package:numeru/data/models/summary_model.dart';

class SplitSummaryScreen extends StatelessWidget {
  final SummaryModel summaryModel;

  const SplitSummaryScreen({super.key, required this.summaryModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Summary")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildTotalSection(theme),
          const SizedBox(height: 16),
          ...summaryModel.summaryPerson.map(
            (person) => _buildPersonCard(theme, person),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalSection(ThemeData theme) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Overall Summary",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _row("Total", summaryModel.total),
            _row("Service Charge", summaryModel.totalServiceCharge),
            _row("SST", summaryModel.totalSst),
            const Divider(height: 24),
            _row("Persons", summaryModel.persons.toDouble(), isMoney: false),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonCard(ThemeData theme, SummaryPerson person) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              person.name,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            _row("Subtotal", person.totalNeedToPay),
            _row("Service Charge", person.totalServiceCharge),
            _row("SST", person.totalSst),

            const SizedBox(height: 12),
            Text("Foods:", style: theme.textTheme.bodyLarge),
            const SizedBox(height: 6),

            ...person.foods.map((food) => _buildFoodItem(food)),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodItem(SummaryFood food) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text("${food.name} x${food.quantity}")),
          Text("RM ${food.priceWithSst.toStringAsFixed(2)}"),
        ],
      ),
    );
  }

  Widget _row(String label, double value, {bool isMoney = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            isMoney
                ? "RM ${value.toStringAsFixed(2)}"
                : value.toStringAsFixed(0),
          ),
        ],
      ),
    );
  }
}
