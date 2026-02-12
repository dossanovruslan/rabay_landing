import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:html' as html;
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/terms.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      color: AppTheme.darkFooter,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 40 : 60,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
              const SizedBox(height: 40),
              const Divider(color: Colors.white24),
              const SizedBox(height: 24),
              _buildCopyright(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBrandSection()),
        const SizedBox(width: 60),
        Expanded(flex: 4, child: _buildLinksSection()),
        const SizedBox(width: 60),
        Expanded(flex: 3, child: _buildContactSection()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandSection(),
        const SizedBox(height: 32),
        _buildLinksSection(),
        const SizedBox(height: 32),
        _buildContactSection(),
      ],
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryColor, AppTheme.primaryDark],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              AppConstants.appName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          AppConstants.footerDescription,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.7),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksSection() {
    return Wrap(
      spacing: 24,
      runSpacing: 12,
      children: AppConstants.footerLinks.map((link) {
        return InkWell(
          onTap: () => _handleLinkTap(link),
          child: Text(
            link['title']!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        );
      }).toList(),
    );
  }

  void _handleLinkTap(Map<String, String> link) {
    final type = link['type'] ?? 'link';

    if (type == 'terms') {
      _showTermsInNewWindow(link);
    } else {
      _launchUrl(link['url']!);
    }
  }

  void _showTermsInNewWindow(Map<String, String> link) {
    final contentKey = link['contentKey'];
    String htmlContent = '';

    if (contentKey == 'termsOfService') {
      htmlContent = termsOfService;
    } else if (contentKey == 'privacyPolicy') {
      htmlContent = privacyPolicy;
    }

    if (htmlContent.isNotEmpty) {
      // Открываем HTML контент в новой вкладке
      final blob = html.Blob([htmlContent], 'text/html');
      final url = html.Url.createObjectUrlFromBlob(blob);
      html.window.open(url, '_blank');
      html.Url.revokeObjectUrl(url);
    }
  }

  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Контакты',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),

        // Email
        InkWell(
          onTap: () => _launchUrl(AppConstants.emailUrl),
          child: Text(
            AppConstants.emailUrl.replaceAll('mailto:', ''),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Social media
        Text(
          'Социальные сети',
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.instagram,
              AppConstants.instagramUrl,
            ),
            const SizedBox(width: 16),
            _buildSocialIcon(
              FontAwesomeIcons.telegram,
              AppConstants.telegramUrl,
            ),
            const SizedBox(width: 16),
            _buildSocialIcon(
              FontAwesomeIcons.facebook,
              AppConstants.facebookUrl,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return InkWell(
      onTap: () => _launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildCopyright() {
    return Text(
      AppConstants.copyrightText,
      style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.6)),
      textAlign: TextAlign.center,
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
