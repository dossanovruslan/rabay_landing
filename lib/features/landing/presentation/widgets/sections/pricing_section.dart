import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../common/gradient_button.dart';
import '../common/section_title.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 24,
        vertical: 80,
      ),
      color: Colors.grey[50],
      child: Column(
        children: [
          const SectionTitle(
            title: 'Простые тарифы',
            subtitle: 'Выберите то, что подходит именно вам',
          ),
          const SizedBox(height: 60),
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: AppConstants.pricing.map((plan) {
                  return _buildPricingCard(
                    context,
                    plan,
                    constraints.maxWidth > 900
                        ? (constraints.maxWidth - 360) / 3
                        : constraints.maxWidth > 600
                        ? (constraints.maxWidth - 180) / 2
                        : constraints.maxWidth,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPricingCard(
    BuildContext context,
    Map<String, dynamic> plan,
    double width,
  ) {
    final bool isPopular = plan['isPopular'];

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: width,
          constraints: const BoxConstraints(minWidth: 300),
          margin: const EdgeInsets.only(top: 12),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isPopular
                  ? AppTheme.primaryColor
                  : Colors.grey.withOpacity(0.2),
              width: isPopular ? 2 : 1,
            ),
            boxShadow: [
              if (isPopular)
                BoxShadow(
                  color: AppTheme.primaryColor.withOpacity(0.2),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
            ],
          ),
          child: Column(
            children: [
              Text(
                plan['name'],
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    plan['price'],
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                  Text(
                    plan['period'],
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              ...((plan['features'] as List<String>).map((feature) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          feature,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                );
              })),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: GradientButton(
                  text: 'Выбрать',
                  onPressed: () {},
                  isSecondary: !isPopular,
                ),
              ),
            ],
          ),
        ),
        if (isPopular)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Text(
              'ПОПУЛЯРНЫЙ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
