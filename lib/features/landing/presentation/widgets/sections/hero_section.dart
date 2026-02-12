import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../common/app_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withOpacity(0.1),
            Colors.white,
            AppTheme.primaryColor.withOpacity(0.05),
          ],
        ),
      ),
      child: Stack(
        children: [
          // Background decorative elements
          ..._buildBackgroundElements(),

          // Main content
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
                vertical: isMobile ? 100 : (isTablet ? 120 : 140),
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

  List<Widget> _buildBackgroundElements() {
    return [
      Positioned(
        top: 50,
        right: 100,
        child: FadeIn(
          duration: const Duration(milliseconds: 1500),
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
      Positioned(
        bottom: 100,
        left: 50,
        child: FadeIn(
          duration: const Duration(milliseconds: 1800),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.08),
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      Positioned(
        top: 200,
        left: 200,
        child: FadeIn(
          duration: const Duration(milliseconds: 2000),
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.06),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
      ),
    ];
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
    return FadeInLeft(
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: isMobile
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppConstants.heroTitle,
            style: TextStyle(
              fontSize: isMobile ? 32 : 48,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
              height: 1.2,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 24),
          Text(
            AppConstants.heroSubtitle,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 40),

          // Download buttons
          isMobile
              ? Column(
                  children: [
                    _buildAppStoreButton(isFullWidth: true),
                    const SizedBox(height: 16),
                    _buildGooglePlayButton(isFullWidth: true),
                  ],
                )
              : Row(
                  children: [
                    _buildAppStoreButton(isFullWidth: false),
                    const SizedBox(width: 16),
                    _buildGooglePlayButton(isFullWidth: false),
                  ],
                ),

          const SizedBox(height: 32),

          // Mission text
          Text(
            AppConstants.heroMission,
            style: TextStyle(
              fontSize: isMobile ? 14 : 16,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
        ],
      ),
    );
  }

  Widget _buildRightContent(BuildContext context, bool isMobile) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 300 : 400,
            maxHeight: isMobile ? 600 : 800,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.3),
                blurRadius: 50,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              AppConstants.screenShoppingList,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppTheme.lightSectionBg,
                    borderRadius: BorderRadius.circular(40),
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
