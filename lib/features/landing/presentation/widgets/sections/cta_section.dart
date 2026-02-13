import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../common/app_button.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

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
          colors: [AppTheme.primaryColor, AppTheme.primaryDark],
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 60 : 100,
      ),
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
        Expanded(flex: 6, child: _buildTextContent(false)),
        // const SizedBox(width: 60),
        // Expanded(flex: 4, child: _buildPhoneMockup(false)),
      ],
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      children: [
        _buildTextContent(isMobile),
        SizedBox(height: isMobile ? 32 : 40),
        _buildPhoneMockup(isMobile),
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
            AppConstants.ctaTitle,
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
          ),
          const SizedBox(height: 20),
          Text(
            AppConstants.ctaSubtitle,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white.withOpacity(0.9),
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

          const SizedBox(height: 40),

          // Stats
          _buildStats(isMobile),
        ],
      ),
    );
  }

  Widget _buildPhoneMockup(bool isMobile) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 250 : 300,
            maxHeight: isMobile ? 500 : 600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              AppConstants.screenAccounts,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.phone_iphone,
                      size: 80,
                      color: Colors.white,
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

  Widget _buildStats(bool isMobile) {
    return isMobile
        ? Column(
            children: AppConstants.stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: _StatItem(value: stat['value']!, label: stat['label']!),
              );
            }).toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: AppConstants.stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(right: 48),
                child: _StatItem(value: stat['value']!, label: stat['label']!),
              );
            }).toList(),
          );
  }

  Widget _buildAppStoreButton({required bool isFullWidth}) {
    return AppButton(
      text: 'App Store',
      icon: FontAwesomeIcons.apple,
      onPressed: () => _launchUrl(AppConstants.appStoreUrl),
      backgroundColor: Colors.white,
      textColor: AppTheme.primaryColor,
      isFullWidth: isFullWidth,
    );
  }

  Widget _buildGooglePlayButton({required bool isFullWidth}) {
    return AppButton(
      text: 'Google Play',
      icon: FontAwesomeIcons.googlePlay,
      onPressed: () => _launchUrl(AppConstants.googlePlayUrl),
      backgroundColor: Colors.white,
      textColor: AppTheme.primaryColor,
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

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
        ),
      ],
    );
  }
}
