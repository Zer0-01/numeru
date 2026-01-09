import 'package:flutter/material.dart';
import 'package:numeru/extensions/context_extension.dart';

class AppHeroWidget extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final String imageUrl;
  final String title;
  final String? subtitle;
  final String? label;

  const AppHeroWidget({
    super.key,
    this.padding,
    this.borderRadius,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.25),
              Colors.black.withValues(alpha: 0.6),
            ],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null)
                Text(
                  label ?? "",
                  style: context.textTheme.labelMedium?.copyWith(
                    color: context.colorScheme.surfaceContainerLowest,
                  ),
                ),
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.colorScheme.surfaceContainerLowest,
                ),
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
