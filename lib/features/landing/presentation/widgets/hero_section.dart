import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../../../../../core/theme/app_theme.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 100 : (isTablet ? 60 : 40),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withOpacity(0.05),
            AppTheme.secondaryColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'RaBay',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isDesktop ? 72 : (isTablet ? 56 : 42),
                fontWeight: FontWeight.w900,
                background: Paint()
                  ..shader = const LinearGradient(
                    colors: [AppTheme.primaryColor, AppTheme.secondaryColor],
                  ).createShader(const Rect.fromLTWH(0, 0, 300, 70)),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          FadeInDown(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Учет личных финансов',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: isDesktop ? 32 : (isTablet ? 24 : 20),
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 32),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 400),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: isDesktop ? 700 : double.infinity,
              ),
              child: Text(
                'Простое приложение для контроля личных финансов! '
                'Следи за расходами, управляй бюджетом!',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: isDesktop ? 20 : (isTablet ? 18 : 16),
                  height: 1.8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
