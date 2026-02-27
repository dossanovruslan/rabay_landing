import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'dart:convert';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/terms.dart';
import '../../../../../core/localization/app_localizations.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      color: AppTheme.darkFooter,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 40 : 56,
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              isMobile ? _buildMobileLayout(l10n) : _buildDesktopLayout(l10n),
              const SizedBox(height: 32),
              Divider(color: Colors.white.withValues(alpha: 0.16)),
              const SizedBox(height: 20),
              _buildCopyright(l10n),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(AppLocalizations l10n) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 3, child: _buildBrandSection(l10n)),
        const SizedBox(width: 60),
        Expanded(flex: 4, child: _buildLinksSection(l10n)),
        const SizedBox(width: 60),
        Expanded(flex: 3, child: _buildContactSection(l10n)),
      ],
    );
  }

  Widget _buildMobileLayout(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrandSection(l10n),
        const SizedBox(height: 32),
        _buildLinksSection(l10n),
        const SizedBox(height: 32),
        _buildContactSection(l10n),
      ],
    );
  }

  Widget _buildBrandSection(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.account_balance_wallet_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              l10n.appName,
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
          l10n.footerDescription,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withValues(alpha: 0.72),
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksSection(AppLocalizations l10n) {
    return Wrap(
      spacing: 24,
      runSpacing: 12,
      children: l10n.footerLinks.map((link) {
        return InkWell(
          onTap: () => _handleLinkTap(link, l10n.languageCode),
          child: Text(
            link['title']!,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.82),
            ),
          ),
        );
      }).toList(),
    );
  }

  Future<void> _handleLinkTap(
    Map<String, String> link,
    String languageCode,
  ) async {
    final type = link['type'] ?? 'link';

    if (type == 'terms') {
      await _showTermsInNewWindow(link, languageCode);
    } else {
      // _launchUrl(link['url']!);
    }
  }

  Future<void> _showTermsInNewWindow(
    Map<String, String> link,
    String languageCode,
  ) async {
    final contentKey = link['contentKey'];
    final htmlContent = getLocalizedTermsContent(
      contentKey: contentKey ?? '',
      languageCode: languageCode,
    );

    if (htmlContent.isNotEmpty) {
      final termsUri = Uri.dataFromString(
        htmlContent,
        mimeType: 'text/html',
        encoding: utf8,
      );
      await launchUrl(termsUri, webOnlyWindowName: '_blank');
    }
  }

  Widget _buildContactSection(AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.contacts,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 12),

        // Email
        InkWell(
          onTap: () => _launchUrl(AppConstants.emailUrl),
          child: Text(
            AppConstants.emailUrl.replaceAll('mailto:', ''),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withValues(alpha: 0.82),
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Social media
        Text(
          l10n.socialNetworks,
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
            _buildSocialIcon(FontAwesomeIcons.threads, AppConstants.threadsUrl),
            const SizedBox(width: 16),
            _buildSocialIcon(
              FontAwesomeIcons.telegram,
              AppConstants.telegramUrl,
            ),
            const SizedBox(width: 16),
            _buildSocialIcon(FontAwesomeIcons.tiktok, AppConstants.tiktokUrl),
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
          color: Colors.white.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildCopyright(AppLocalizations l10n) {
    return Text(
      l10n.copyrightText,
      style: TextStyle(
        fontSize: 13,
        color: Colors.white.withValues(alpha: 0.62),
      ),
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
