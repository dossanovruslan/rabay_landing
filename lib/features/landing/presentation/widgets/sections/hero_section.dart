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
      decoration: const BoxDecoration(gradient: AppTheme.heroGradient),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Ambient orb — top right
          Positioned(
            right: -160,
            top: -120,
            child: _buildOrb(
              560,
              AppTheme.primaryColor.withValues(alpha: 0.18),
            ),
          ),
          // Ambient orb — bottom left
          Positioned(
            left: -120,
            bottom: -80,
            child: _buildOrb(
              420,
              AppTheme.primaryColor.withValues(alpha: 0.11),
            ),
          ),
          // Ambient orb — center right accent
          Positioned(
            right: 80,
            bottom: 60,
            child: _buildOrb(
              260,
              const Color(0xFF0560C9).withValues(alpha: 0.14),
            ),
          ),
          // Content
          Center(
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
        ],
      ),
    );
  }

  Widget _buildOrb(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, Colors.transparent],
          stops: const [0.0, 1.0],
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 6, child: _buildLeftContent(context, false)),
        const SizedBox(width: 80),
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
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.20),
              width: 1,
            ),
          ),
          child: Text(
            l10n.heroBadge,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 0.3,
            ),
          ),
        ),
        const SizedBox(height: 24),
        // Title
        Text(
          l10n.heroTitle,
          style: TextStyle(
            fontSize: isMobile ? 34 : 54,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.10,
            letterSpacing: -0.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 22),
        // Subtitle
        Text(
          l10n.heroSubtitle,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white.withValues(alpha: 0.72),
            height: 1.65,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 36),
        // Buttons
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
        const SizedBox(height: 28),
        // Mission tag line
        Row(
          mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: AppTheme.accentGreen,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              l10n.heroMission,
              style: TextStyle(
                fontSize: isMobile ? 14 : 15,
                color: Colors.white.withValues(alpha: 0.60),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRightContent(BuildContext context, bool isMobile) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 280 : 360,
          maxHeight: isMobile ? 560 : 740,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.15),
            width: 1,
          ),
          boxShadow: [
            // Teal ambient glow
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.35),
              blurRadius: 70,
              spreadRadius: -10,
              offset: const Offset(0, 24),
            ),
            // Deep shadow
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.30),
              blurRadius: 40,
              offset: const Offset(0, 16),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.asset(
            AppConstants.screenShoppingList,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  color: AppTheme.heroBgAccent,
                  borderRadius: BorderRadius.circular(32),
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
      backgroundColor: Colors.white,
      textColor: AppTheme.textPrimary,
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
