import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeru/data/models/split_summary_model.dart';
import 'package:numeru/extensions/context_extension.dart';

@RoutePage()
class SplitSummaryScreen extends StatelessWidget {
  final SplitSummaryModel summary;

  const SplitSummaryScreen({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Split Summary"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: _GeneralInfoCard(summary: summary),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Person Summary",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final person = summary.personSummaries[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: _PersonSummaryCard(person: person),
                  );
                },
                childCount: summary.personSummaries.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}

class _GeneralInfoCard extends StatelessWidget {
  final SplitSummaryModel summary;

  const _GeneralInfoCard({required this.summary});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _InfoRow(
            label: "Subtotal",
            value: summary.subtotal,
          ),
          _InfoRow(
            label: "Tax (${summary.taxPercentage}%)",
            value: summary.taxAmount,
          ),
          const Divider(height: 24),
          _InfoRow(
            label: "Total",
            value: summary.totalAmount,
            isTotal: true,
          ),
        ],
      ),
    );
  }
}

class _PersonSummaryCard extends StatelessWidget {
  final PersonSummaryModel person;

  const _PersonSummaryCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: context.colorScheme.outlineVariant,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                person.name,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                person.totalAmount.toString(),
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            person.itemNames.join(", "),
            style: context.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final double value;
  final bool isTotal;

  const _InfoRow({
    required this.label,
    required this.value,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                )
              : context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurfaceVariant,
                ),
        ),
        Text(
          value.toStringAsFixed(2),
          style: isTotal
              ? context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                )
              : context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
        ),
      ],
    );
  }
}
