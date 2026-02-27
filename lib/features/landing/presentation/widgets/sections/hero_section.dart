import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../common/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      color: AppTheme.backgroundColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
            vertical: isMobile ? 108 : (isTablet ? 120 : 132),
          ),
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
        // Left side - Text content
        Expanded(flex: 6, child: _buildLeftContent(context, false)),
        const SizedBox(width: 80),
        // Right side - Phone mockup
        Expanded(flex: 4, child: _buildRightContent(context, false)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isMobile) {
    return Column(
      children: [
        _buildLeftContent(context, isMobile),
        SizedBox(height: isMobile ? 40 : 60),
        _buildRightContent(context, isMobile),
      ],
    );
  }

  Widget _buildLeftContent(BuildContext context, bool isMobile) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            l10n.heroBadge,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.heroTitle,
          style: TextStyle(
            fontSize: isMobile ? 34 : 52,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            height: 1.14,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 22),
        Text(
          l10n.heroSubtitle,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 34),
        isMobile
            ? Column(
                children: [
                  _buildAppStoreButton(isFullWidth: true),
                  const SizedBox(height: 12),
                  _buildGooglePlayButton(isFullWidth: true),
                ],
              )
            : Row(
                children: [
                  _buildAppStoreButton(isFullWidth: false),
                  const SizedBox(width: 12),
                  _buildGooglePlayButton(isFullWidth: false),
                ],
              ),
        const SizedBox(height: 24),
        Text(
          l10n.heroMission,
          style: TextStyle(
            fontSize: isMobile ? 14 : 15,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context, bool isMobile) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 300 : 390,
          maxHeight: isMobile ? 600 : 780,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset(
            AppConstants.screenShoppingList,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: AppTheme.lightSectionBg,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Center(
                  child: Icon(
                    Icons.phone_iphone,
                    size: 100,
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

  Widget _buildAppStoreButton({required bool isFullWidth}) {
    return AppButton(
      text: 'App Store',
      icon: FontAwesomeIcons.apple,
      onPressed: () => _launchUrl(AppConstants.appStoreUrl),
      backgroundColor: AppTheme.textPrimary,
      textColor: Colors.white,
      isFullWidth: isFullWidth,
    );
  }

  Widget _buildGooglePlayButton({required bool isFullWidth}) {
    return AppButton(
      text: 'Google Play',
      icon: FontAwesomeIcons.googlePlay,
      onPressed: () => _launchUrl(AppConstants.googlePlayUrl),
      backgroundColor: AppTheme.primaryColor,
      textColor: Colors.white,
      isFullWidth: isFullWidth,
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
