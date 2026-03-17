import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/localization/app_localizations.dart';

class BenefitsSection extends StatelessWidget {
  const BenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 64 : 96,
      ),
      color: AppTheme.surfaceColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? _buildMobileLayout(context)
              : (isTablet
                    ? _buildTabletLayout(context)
                    : _buildDesktopLayout(context)),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: _buildBenefitCard(context, 0)),
          const SizedBox(width: 28),
          Expanded(child: _buildBenefitCard(context, 1)),
          const SizedBox(width: 28),
          Expanded(child: _buildBenefitCard(context, 2)),
        ],
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildBenefitCard(context, 0)),
              const SizedBox(width: 24),
              Expanded(child: _buildBenefitCard(context, 1)),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _buildBenefitCard(context, 2),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildBenefitCard(context, 0),
        const SizedBox(height: 20),
        _buildBenefitCard(context, 1),
        const SizedBox(height: 20),
        _buildBenefitCard(context, 2),
      ],
    );
  }

  Widget _buildBenefitCard(BuildContext context, int index) {
    final benefit = AppLocalizations.of(context).benefits[index];
    final icons = [
      Icons.assessment_rounded,
      Icons.track_changes_rounded,
      Icons.list_alt_rounded,
    ];
    final numbers = ['01', '02', '03'];

    return _BenefitCard(
      icon: icons[index],
      number: numbers[index],
      title: benefit['title']!,
      description: benefit['description']!,
    );
  }
}

class _BenefitCard extends StatefulWidget {
  final IconData icon;
  final String number;
  final String title;
  final String description;

  const _BenefitCard({
    required this.icon,
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  State<_BenefitCard> createState() => _BenefitCardState();
}

class _BenefitCardState extends State<_BenefitCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        transform: Matrix4.translationValues(0, _isHovered ? -4 : 0, 0),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? AppTheme.primaryColor.withValues(alpha: 0.30)
                : const Color(0xFFE8EDF3),
            width: 1,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppTheme.primaryColor.withValues(alpha: 0.12),
                    blurRadius: 30,
                    spreadRadius: -4,
                    offset: const Offset(0, 12),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon + number row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gradient icon container
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    gradient: AppTheme.iconGradient,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withValues(alpha: 0.25),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(widget.icon, size: 26, color: Colors.white),
                ),
                // Decorative number
                Text(
                  widget.number,
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.primaryColor.withValues(alpha: 0.08),
                    height: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 22),
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 12),
            // Description
            Text(
              widget.description,
              style: const TextStyle(
                fontSize: 15,
                color: AppTheme.textSecondary,
                height: 1.65,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
