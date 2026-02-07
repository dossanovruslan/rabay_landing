import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../common/section_title.dart';

class ProblemSolutionSection extends StatelessWidget {
  const ProblemSolutionSection({super.key});

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
            title: 'Знакомая ситуация?',
            subtitle: 'Многие сталкиваются с этими проблемами ежедневно',
          ),
          const SizedBox(height: 60),

          // Problems
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: AppConstants.problems.map((problem) {
                  return FadeInUp(
                    child: _buildProblemCard(
                      context,
                      problem['title']!,
                      problem['description']!,
                      constraints.maxWidth > 900
                          ? (constraints.maxWidth - 360) /
                                3 // 3 columns minus spacing
                          : constraints.maxWidth, // Full width
                    ),
                  );
                }).toList(),
              );
            },
          ),

          const SizedBox(height: 80),

          FadeIn(
            child: const Icon(
              Icons.arrow_downward_rounded,
              size: 40,
              color: AppTheme.primaryColor,
            ),
          ),

          const SizedBox(height: 80),

          // Solution Head
          const SectionTitle(
            title: 'У нас есть решение',
            subtitle: 'RaBay превращает хаос в порядок',
            color: AppTheme.primaryColor,
          ),
          const SizedBox(height: 60),

          // Solutions
          LayoutBuilder(
            builder: (context, constraints) {
              return Wrap(
                spacing: 40,
                runSpacing: 40,
                alignment: WrapAlignment.center,
                children: AppConstants.solutions.map((solution) {
                  return FadeInUp(
                    child: _buildSolutionCard(
                      context,
                      solution['title']!,
                      solution['description']!,
                      constraints.maxWidth > 900
                          ? (constraints.maxWidth - 360) / 3
                          : constraints.maxWidth,
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

  Widget _buildProblemCard(
    BuildContext context,
    String title,
    String desc,
    double width,
  ) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minWidth: 300),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.red.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFFFEBEE),
            child: Icon(Icons.close, color: Colors.red),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: Colors.grey[600], height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildSolutionCard(
    BuildContext context,
    String title,
    String desc,
    double width,
  ) {
    return Container(
      width: width,
      constraints: const BoxConstraints(minWidth: 300),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F0FF),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFEBE8FF),
            child: Icon(Icons.check, color: AppTheme.primaryColor),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(desc, style: TextStyle(color: Colors.grey[800], height: 1.5)),
        ],
      ),
    );
  }
}
