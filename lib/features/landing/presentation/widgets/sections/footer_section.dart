// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/constants/app_constants.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  void _launchUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      color: const Color(0xFF1E1E2E), // Dark footer
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 24,
        vertical: 60,
      ),
      child: Column(
        children: [
          _buildTopContent(context, isDesktop),
          const SizedBox(height: 60),
          const Divider(color: Colors.white24),
          const SizedBox(height: 32),
          _buildBottomContent(isDesktop),
        ],
      ),
    );
  }

  Widget _buildTopContent(BuildContext context, bool isDesktop) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(flex: 2, child: _buildBrandCol()),
          Expanded(
            child: _buildLinksCol('Компания', ['О нас', 'Вакасии', 'Блог']),
          ),
          Expanded(
            child: _buildLinksCol('Поддержка', ['Помощь', 'Контакты', 'FAQ']),
          ),
          Expanded(
            child: _buildLinksCol('Юридическая информация', [
              'Политика конфиденциальности',
              'Условия использования',
            ]),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildBrandCol(),
          const SizedBox(height: 40),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              _buildLinksCol('Компания', ['О нас', 'Вакасии', 'Блог']),
              _buildLinksCol('Поддержка', ['Помощь', 'Контакты', 'FAQ']),
              _buildLinksCol('Юридическая информация', [
                'Политика конфиденциальности',
                'Условия использования',
              ]),
            ],
          ),
        ],
      );
    }
  }

  Widget _buildBrandCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RaBay',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Ваш умный помощник в мире финансов.\nКонтролируйте, планируйте и приумножайте.',
          style: TextStyle(
            color: Colors.white.withOpacity(0.7),
            fontSize: 16,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            _buildSocialIcon(Icons.camera_alt, AppConstants.instagramUrl),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.send, AppConstants.telegramUrl),
            const SizedBox(width: 16),
            _buildSocialIcon(Icons.facebook, AppConstants.facebookUrl),
          ],
        ),
      ],
    );
  }

  Widget _buildLinksCol(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {},
              child: Text(
                link,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 16,
                ),
              ),
            ),
          ),
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
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }

  Widget _buildBottomContent(bool isDesktop) {
    final copyright = Text(
      '© ${DateTime.now().year} RaBay. Все права защищены.',
      style: TextStyle(color: Colors.white.withOpacity(0.5), fontSize: 14),
      textAlign: isDesktop ? TextAlign.start : TextAlign.center,
    );

    if (isDesktop) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          copyright,
          Row(
            children: [
              _buildStoreBadge('App Store'),
              const SizedBox(width: 16),
              _buildStoreBadge('Google Play'),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStoreBadge('App Store'),
              const SizedBox(width: 16),
              _buildStoreBadge('Google Play'),
            ],
          ),
          const SizedBox(height: 24),
          copyright,
        ],
      );
    }
  }

  Widget _buildStoreBadge(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white24),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
