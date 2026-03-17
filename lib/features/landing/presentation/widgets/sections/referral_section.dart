import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:auto_route/auto_route.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/navigation/app_router.dart';
import '../common/app_button.dart';

class ReferralSection extends StatelessWidget {
  const ReferralSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: AppTheme.referralGradient),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Decorative orb top-right
          Positioned(
            right: -180,
            top: -100,
            child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withValues(alpha: 0.14),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
          // Decorative orb bottom-left
          Positioned(
            left: -100,
            bottom: -80,
            child: Container(
              width: 360,
              height: 360,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppTheme.primaryColor.withValues(alpha: 0.09),
                    Colors.transparent,
                  ],
                ),
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
              child: Column(
                children: [
                  _buildTitleSection(context, isMobile),
                  SizedBox(height: isMobile ? 44 : 64),
                  isMobile
                      ? _buildMobileLevelCards(context)
                      : _buildDesktopLevelCards(context),
                  SizedBox(height: isMobile ? 44 : 64),
                  _buildHowItWorks(context, isMobile),
                  SizedBox(height: isMobile ? 40 : 48),
                  AppButton(
                    text: AppLocalizations.of(context).referralStartEarning,
                    icon: Icons.rocket_launch_rounded,
                    onPressed: () =>
                        context.router.push(const ReferralDetailsRoute()),
                    backgroundColor: AppTheme.primaryColor,
                    textColor: Colors.white,
                    isFullWidth: isMobile,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitleSection(BuildContext context, bool isMobile) {
    final program = AppLocalizations.of(context).referralProgram;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.20),
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: AppTheme.primaryColor.withValues(alpha: 0.35),
              width: 1,
            ),
          ),
          child: Text(
            AppLocalizations.of(context).navReferral,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          program['title'] as String,
          style: TextStyle(
            fontSize: isMobile ? 32 : 44,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            height: 1.12,
            letterSpacing: -0.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        Text(
          program['subtitle'] as String,
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: Colors.white.withValues(alpha: 0.65),
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDesktopLevelCards(BuildContext context) {
    final levels =
        AppLocalizations.of(context).referralProgram['levels'] as List;

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
            child: _LevelCard(level: levels[index], index: index),
          ),
        ),
      ),
    );
  }

  Widget _buildMobileLevelCards(BuildContext context) {
    final levels =
        AppLocalizations.of(context).referralProgram['levels'] as List;

    return Column(
      children: List.generate(
        levels.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: _LevelCard(level: levels[index], index: index),
        ),
      ),
    );
  }

  Widget _buildHowItWorks(BuildContext context, bool isMobile) {
    final l10n = AppLocalizations.of(context);
    final howItWorks = l10n.referralProgram['howItWorks'] as List<String>;

    return Column(
      children: [
        Text(
          l10n.referralHowItWorks,
          style: TextStyle(
            fontSize: isMobile ? 22 : 26,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 28),
        ...List.generate(
          howItWorks.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    howItWorks[index],
                    style: TextStyle(
                      fontSize: isMobile ? 15 : 16,
                      color: Colors.white.withValues(alpha: 0.80),
                      height: 1.5,
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
  final int index;

  const _LevelCard({required this.level, required this.index});

  @override
  State<_LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<_LevelCard> {
  bool _isHovered = false;

  // Slightly different border accent per card
  static const _cardAccents = [
    AppTheme.primaryColor,
    Color(0xFF0560C9),
    Color(0xFF7C3AED),
  ];

  @override
  Widget build(BuildContext context) {
    final accent = _cardAccents[widget.index % _cardAccents.length];

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: _isHovered ? 0.10 : 0.06),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? accent.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.12),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: accent.withValues(alpha: 0.20),
                    blurRadius: 30,
                    spreadRadius: -4,
                    offset: const Offset(0, 8),
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            // Percentage — gradient text
            ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) => const LinearGradient(
                colors: [Color(0xFF038AA6), Color(0xFF0BBCD4)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                widget.level['percentage'] as String,
                style: const TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  height: 1,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.level['title'] as String,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.level['subtitle'] as String,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withValues(alpha: 0.60),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: accent.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Text(
                widget.level['description'] as String,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: accent.withValues(alpha: 0.90),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
