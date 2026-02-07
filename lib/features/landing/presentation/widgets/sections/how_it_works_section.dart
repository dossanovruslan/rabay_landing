import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../common/section_title.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

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
            title: 'Как это работает',
            subtitle: 'Начните контролировать бюджет за 4 шага',
          ),
          const SizedBox(height: 60),
          isDesktop ? _buildDesktopSteps(context) : _buildMobileSteps(context),
        ],
      ),
    );
  }

  Widget _buildDesktopSteps(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: AppConstants.steps.map((step) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: _buildStepItem(context, step),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMobileSteps(BuildContext context) {
    return Column(
      children: AppConstants.steps.map((step) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: _buildStepItem(context, step),
        );
      }).toList(),
    );
  }

  Widget _buildStepItem(BuildContext context, Map<String, String> step) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Text(
            step['number']!,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          step['title']!,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          step['description']!,
          style: TextStyle(fontSize: 16, color: Colors.grey[600], height: 1.5),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
