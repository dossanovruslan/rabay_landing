import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../common/app_button.dart';

class ReferralSection extends StatelessWidget {
  const ReferralSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 60 : 88,
      ),
      color: AppTheme.lightSectionBg,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Title Section
              _buildTitleSection(isMobile),
              SizedBox(height: isMobile ? 40 : 60),

              // Level Cards
              isMobile ? _buildMobileLevelCards() : _buildDesktopLevelCards(),

              SizedBox(height: isMobile ? 40 : 60),

              // How it works
              _buildHowItWorks(isMobile),

              SizedBox(height: isMobile ? 32 : 40),

              // CTA Button
              AppButton(
                text: 'Начать зарабатывать',
                icon: Icons.rocket_launch,
                onPressed: () => _launchUrl(AppConstants.appStoreUrl),
                backgroundColor: AppTheme.primaryColor,
                textColor: Colors.white,
                isFullWidth: isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  Widget _buildTitleSection(bool isMobile) {
    final program = AppConstants.referralProgram;

    return Column(
      children: [
        Text(
          program['title'] as String,
          style: TextStyle(
            fontSize: isMobile ? 32 : 42,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),
        Text(
          program['subtitle'] as String,
          style: TextStyle(
            fontSize: isMobile ? 17 : 18,
            color: AppTheme.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDesktopLevelCards() {
    final levels = AppConstants.referralProgram['levels'] as List;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        levels.length,
        (index) => Expanded(
          child: Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : 16,
              right: index == levels.length - 1 ? 0 : 16,
            ),
            child: _LevelCard(level: levels[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLevelCards() {
    final levels = AppConstants.referralProgram['levels'] as List;

    return Column(
      children: List.generate(
        levels.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: _LevelCard(level: levels[index]),
        ),
      ),
    );
  }

  Widget _buildHowItWorks(bool isMobile) {
    final howItWorks =
        AppConstants.referralProgram['howItWorks'] as List<String>;

    return Column(
      children: [
        Text(
          'Как это работает',
          style: TextStyle(
            fontSize: isMobile ? 24 : 28,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 28),
        ...List.generate(
          howItWorks.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withValues(alpha: 0.14),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    howItWorks[index],
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 16,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LevelCard extends StatefulWidget {
  final Map<String, dynamic> level;

  const _LevelCard({required this.level});

  @override
  State<_LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<_LevelCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -2 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primaryColor.withValues(alpha: 0.35)
                : Colors.grey.withValues(alpha: 0.2),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isHovered ? 0.07 : 0.04),
              blurRadius: _isHovered ? 16 : 10,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              widget.level['percentage'] as String,
              style: const TextStyle(
                fontSize: 44,
                fontWeight: FontWeight.w700,
                color: AppTheme.primaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.level['title'] as String,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.level['subtitle'] as String,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              widget.level['description'] as String,
              style: TextStyle(
                fontSize: 14,
                color: AppTheme.textPrimary.withValues(alpha: 0.85),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
