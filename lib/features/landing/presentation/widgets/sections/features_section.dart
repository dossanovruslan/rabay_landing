import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../common/feature_card.dart';
import '../common/section_title.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 24,
        vertical: 80,
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Всё что нужно для ваших финансов',
            subtitle: 'Мощный функционал в простом интерфейсе',
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              final double cardWidth = isDesktop
                  ? (constraints.maxWidth - 64) /
                        3 // 3 columns
                  : (size.width > 600
                        ? (constraints.maxWidth - 32) /
                              2 // 2 columns
                        : constraints.maxWidth); // 1 column

              return Wrap(
                spacing: 32,
                runSpacing: 32,
                children: AppConstants.features.map((feature) {
                  return SizedBox(
                    width: cardWidth,
                    child: FeatureCard(
                      title: feature['title'],
                      description: feature['description'],
                      icon: feature['icon'],
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
