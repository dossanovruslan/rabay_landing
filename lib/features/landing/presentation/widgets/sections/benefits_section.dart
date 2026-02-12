import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';

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
        vertical: isMobile ? 60 : 100,
      ),
      color: Colors.white,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile
              ? _buildMobileLayout()
              : (isTablet ? _buildTabletLayout() : _buildDesktopLayout()),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildBenefitCard(0, delay: 200)),
        const SizedBox(width: 32),
        Expanded(child: _buildBenefitCard(1, delay: 400)),
        const SizedBox(width: 32),
        Expanded(child: _buildBenefitCard(2, delay: 600)),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildBenefitCard(0, delay: 200)),
            const SizedBox(width: 24),
            Expanded(child: _buildBenefitCard(1, delay: 400)),
          ],
        ),
        const SizedBox(height: 24),
        _buildBenefitCard(2, delay: 600),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildBenefitCard(0, delay: 200),
        const SizedBox(height: 24),
        _buildBenefitCard(1, delay: 400),
        const SizedBox(height: 24),
        _buildBenefitCard(2, delay: 600),
      ],
    );
  }

  Widget _buildBenefitCard(int index, {required int delay}) {
    final benefit = AppConstants.benefits[index];
    final icons = [
      Icons.assessment_rounded,
      Icons.track_changes_rounded,
      Icons.list_alt_rounded,
    ];

    return FadeInUp(
      duration: const Duration(milliseconds: 800),
      delay: Duration(milliseconds: delay),
      child: _BenefitCard(
        icon: icons[index],
        title: benefit['title']!,
        description: benefit['description']!,
      ),
    );
  }
}

class _BenefitCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;

  const _BenefitCard({
    required this.icon,
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
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(0, _isHovered ? -8 : 0, 0),
        padding: const EdgeInsets.all(40),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppTheme.primaryColor.withOpacity(0.1),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered
                  ? AppTheme.primaryColor.withOpacity(0.15)
                  : Colors.black.withOpacity(0.08),
              blurRadius: _isHovered ? 20 : 12,
              offset: Offset(0, _isHovered ? 8 : 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppTheme.primaryColor, AppTheme.primaryDark],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icon, size: 32, color: Colors.white),
            ),
            const SizedBox(height: 24),

            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 12),

            // Description
            Text(
              widget.description,
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.textSecondary,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
