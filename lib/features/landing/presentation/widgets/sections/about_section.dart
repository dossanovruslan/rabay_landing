import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 60 : 100,
      ),
      color: Colors.white,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile || isTablet
              ? _buildMobileLayout(isMobile)
              : _buildDesktopLayout(),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildTextContent(false)),
        const SizedBox(width: 80),
        Expanded(flex: 5, child: _buildImageContent(false)),
      ],
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      children: [
        _buildImageContent(isMobile),
        SizedBox(height: isMobile ? 32 : 40),
        _buildTextContent(isMobile),
      ],
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          Text(
            AppConstants.aboutTitle,
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 24),
          Text(
            AppConstants.aboutDescription,
            style: TextStyle(
              fontSize: isMobile ? 15 : 16,
              color: AppTheme.textSecondary,
              height: 1.8,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildImageContent(bool isMobile) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 300 : 400,
            maxHeight: isMobile ? 600 : 800,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              AppConstants.screenSavings,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: AppTheme.lightSectionBg,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone_android,
                      size: 80,
                      color: AppTheme.primaryColor,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
