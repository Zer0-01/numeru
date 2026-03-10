import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:numeru/data/models/split_summary_model.dart';
import 'package:numeru/extensions/context_extension.dart';
import 'package:numeru/presentation/common_widgets/app_app_bar_widget.dart';

@RoutePage()
class SplitSummaryScreen extends StatelessWidget {
  final SplitSummaryModel summary;

  const SplitSummaryScreen({super.key, required this.summary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppAppBarWidget.back(
        title: "Split Summary",
        onPressedBack: () => Navigator.of(context).pop(),
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
                "Person Breakdown",
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemCount: summary.personSummaries.length,
              itemBuilder: (context, index) {
                final person = summary.personSummaries[index];
                return _PersonSummaryCard(person: person);
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class _GeneralInfoCard extends StatelessWidget {
  final dynamic summary;

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
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        spacing: 12,
        children: [
          _InfoRow(label: "Subtotal", value: summary.subtotal),
          _InfoRow(
            label: "Tax (${summary.taxPercentage.toStringAsFixed(0)}%)",
            value: summary.taxAmount,
          ),
          if (summary.roundingAmount != 0)
            _InfoRow(label: "Rounding", value: summary.roundingAmount),
          const Divider(),
          _InfoRow(
            label: "Total Amount",
            value: summary.totalAmount,
            isTotal: true,
          ),
        ],
      ),
    );
  }
}

class _PersonSummaryCard extends StatelessWidget {
  final dynamic person;

  const _PersonSummaryCard({required this.person});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                person.name,
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "\$${person.totalAmount.toStringAsFixed(2)}",
                style: context.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.primary,
                ),
              ),
            ],
          ),
          if (person.itemNames.isNotEmpty)
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
          style:
              isTotal
                  ? context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                  : context.textTheme.bodyMedium?.copyWith(
                    color: context.colorScheme.onSurfaceVariant,
                  ),
        ),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style:
              isTotal
                  ? context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.primary,
                  )
                  : context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
        ),
      ],
    );
  }
}
