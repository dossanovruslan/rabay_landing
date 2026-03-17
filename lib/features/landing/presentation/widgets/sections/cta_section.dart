import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../common/app_button.dart';

class CtaSection extends StatelessWidget {
  const CtaSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.ctaGradient),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Decorative circles
          Positioned(
            right: -120,
            top: -100,
            child: Container(
              width: 400,
              height: 400,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          Positioned(
            left: -80,
            bottom: -60,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.04),
              ),
            ),
          ),
          Positioned(
            right: 60,
            bottom: -40,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          // Content
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 1200),
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
                vertical: isMobile ? 64 : 96,
              ),
              child: _buildTextContent(context, isMobile || isTablet),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextContent(BuildContext context, bool isMobile) {
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          l10n.ctaTitle,
          style: TextStyle(
            fontSize: isMobile ? 30 : 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.15,
            letterSpacing: -0.5,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 18),
        Text(
          l10n.ctaSubtitle,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white.withValues(alpha: 0.75),
            height: 1.65,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 36),
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
        const SizedBox(height: 36),
        _buildStats(isMobile, l10n),
      ],
    );
  }

  Widget _buildStats(bool isMobile, AppLocalizations l10n) {
    return isMobile
        ? Column(
            children: l10n.stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 28),
                child: _StatItem(value: stat['value']!, label: stat['label']!),
              );
            }).toList(),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: l10n.stats.map((stat) {
              return Padding(
                padding: const EdgeInsets.only(right: 56),
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
      textColor: AppTheme.textPrimary,
      isFullWidth: isFullWidth,
    );
  }

  Widget _buildGooglePlayButton({required bool isFullWidth}) {
    return AppButton(
      text: 'Google Play',
      icon: FontAwesomeIcons.googlePlay,
      onPressed: () => _launchUrl(AppConstants.googlePlayUrl),
      backgroundColor: Colors.white.withValues(alpha: 0.15),
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
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.65),
          ),
        ),
      ],
    );
  }
}
