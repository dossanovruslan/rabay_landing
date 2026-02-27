import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';

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
        vertical: isMobile ? 56 : 84,
      ),
      color: AppTheme.surfaceColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile || isTablet
              ? _buildMobileLayout(context, isMobile)
              : _buildDesktopLayout(context),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildTextContent(context, false)),
        const SizedBox(width: 80),
        Expanded(flex: 5, child: _buildImageContent(false)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    return Column(
      children: [
        _buildImageContent(isMobile),
        SizedBox(height: isMobile ? 32 : 40),
        _buildTextContent(context, isMobile),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.aboutTitle,
          style: TextStyle(
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 20),
        Text(
          l10n.aboutDescription,
          style: TextStyle(
            fontSize: isMobile ? 15 : 16,
            color: AppTheme.textSecondary,
            height: 1.8,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildImageContent(bool isMobile) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 300 : 400,
          maxHeight: isMobile ? 600 : 800,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset(
            AppConstants.screenSavings,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 600,
                decoration: BoxDecoration(
                  color: AppTheme.lightSectionBg,
                  borderRadius: BorderRadius.circular(24),
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
    );
  }
}
