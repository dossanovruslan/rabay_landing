// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../common/gradient_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  void _launchUrl(String url) async {
    if (await canLaunch(url)) await launch(url);
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen size for responsiveness
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 120 : 24,
        vertical: 80,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        color: Colors.white,
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/screens/hero_bg_pattern.png',
          ), // Placeholder
          fit: BoxFit.cover,
          opacity: 0.05,
        ),
      ),
      child: isDesktop
          ? _buildDesktopLayout(context)
          : _buildMobileLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 5, child: _buildTextContent(context, alignLeft: true)),
        const SizedBox(width: 60),
        Expanded(flex: 6, child: _buildImageContent(context)),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildTextContent(context, alignLeft: false),
        const SizedBox(height: 60),
        _buildImageContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context, {required bool alignLeft}) {
    return Column(
      crossAxisAlignment: alignLeft
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        FadeInDown(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '#1 Приложение для финансов',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        FadeInLeft(
          delay: const Duration(milliseconds: 200),
          child: Text(
            AppConstants.heroTitle,
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
              fontWeight: FontWeight.w900,
              height: 1.1,
              fontSize: alignLeft ? 56 : 40,
            ),
            textAlign: alignLeft ? TextAlign.start : TextAlign.center,
          ),
        ),
        const SizedBox(height: 24),
        FadeInLeft(
          delay: const Duration(milliseconds: 400),
          child: Text(
            AppConstants.heroSubtitle,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontSize: 20,
              color: Colors.grey[600],
              height: 1.5,
            ),
            textAlign: alignLeft ? TextAlign.start : TextAlign.center,
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          delay: const Duration(milliseconds: 600),
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: alignLeft ? WrapAlignment.start : WrapAlignment.center,
            children: [
              GradientButton(
                text: 'Скачать бесплатно',
                onPressed: () => _launchUrl(AppConstants.appStoreUrl),
              ),
              GradientButton(
                text: 'Узнать больше',
                isSecondary: true,
                onPressed: () {
                  Scrollable.ensureVisible(
                    context,
                    duration: const Duration(seconds: 1),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        FadeInUp(
          delay: const Duration(milliseconds: 800),
          child: Row(
            mainAxisAlignment: alignLeft
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              _buildStoreBadge(
                'assets/images/screens/app_store.png',
              ), // Placeholder
              const SizedBox(width: 16),
              _buildStoreBadge(
                'assets/images/screens/google_play.png',
              ), // Placeholder
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImageContent(BuildContext context) {
    return FadeInRight(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppTheme.primaryColor.withOpacity(0.05),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(48),
            child: Image.asset(
              'assets/images/screens/main_budget.jpg',
              height: 600,
              // Add shadow or frame mockup if needed
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoreBadge(String assetPath) {
    // In a real app, use SVGs or proper images for store badges
    return Opacity(
      opacity: 0.7,
      child: const Icon(Icons.download, size: 40, color: Colors.grey),
    );
  }
}
