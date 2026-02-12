import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.primaryColor.withOpacity(0.05),
            Colors.white,
            AppTheme.primaryColor.withOpacity(0.08),
          ],
        ),
      ),
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
                onPressed: () {},
                isFullWidth: isMobile,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection(bool isMobile) {
    final program = AppConstants.referralProgram;

    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      child: Column(
        children: [
          Text(
            program['title'] as String,
            style: TextStyle(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            program['subtitle'] as String,
            style: TextStyle(
              fontSize: isMobile ? 18 : 20,
              color: AppTheme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
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
            child: _LevelCard(level: levels[index], delay: 200 + (index * 200)),
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
          child: _LevelCard(level: levels[index], delay: 200 + (index * 200)),
        ),
      ),
    );
  }

  Widget _buildHowItWorks(bool isMobile) {
    final howItWorks =
        AppConstants.referralProgram['howItWorks'] as List<String>;

    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      child: Column(
        children: [
          Text(
            'Как это работает',
            style: TextStyle(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 32),
          ...List.generate(
            howItWorks.length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
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
      ),
    );
  }
}

class _LevelCard extends StatefulWidget {
  final Map<String, dynamic> level;
  final int delay;

  const _LevelCard({required this.level, required this.delay});

  @override
  State<_LevelCard> createState() => _LevelCardState();
}

class _LevelCardState extends State<_LevelCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final levelNum = widget.level['level'] as int;
    final colors = [
      [AppTheme.primaryColor, AppTheme.primaryDark],
      [const Color(0xFF00D4FF), const Color(0xFF0099CC)],
      [const Color(0xFF9C27B0), const Color(0xFF7B1FA2)],
    ];

    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colors[levelNum - 1],
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: colors[levelNum - 1][0].withOpacity(
                  _isHovered ? 0.4 : 0.3,
                ),
                blurRadius: _isHovered ? 20 : 15,
                offset: Offset(0, _isHovered ? 10 : 8),
              ),
            ],
          ),
          child: Column(
            children: [
              // Percentage
              Text(
                widget.level['percentage'] as String,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Title
              Text(
                widget.level['title'] as String,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              // Subtitle
              Text(
                widget.level['subtitle'] as String,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withOpacity(0.9),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // Description
              Text(
                widget.level['description'] as String,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
