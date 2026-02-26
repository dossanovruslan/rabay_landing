import 'package:flutter/material.dart';
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
      color: AppTheme.backgroundColor,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 56 : 84,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 20 : 44,
            vertical: isMobile ? 24 : 36,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 18,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: _buildDesktopLayout(isMobile || isTablet),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(bool isCompact) {
    if (isCompact) {
      return _buildTextContent(true);
    }
    return Row(children: [Expanded(child: _buildTextContent(false))]);
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          AppConstants.ctaTitle,
          style: TextStyle(
            fontSize: isMobile ? 30 : 40,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
            height: 1.2,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 18),
        Text(
          AppConstants.ctaSubtitle,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
        ),
        const SizedBox(height: 32),
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
        const SizedBox(height: 30),
        _buildStats(isMobile),
      ],
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
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary),
        ),
      ],
    );
  }
}
