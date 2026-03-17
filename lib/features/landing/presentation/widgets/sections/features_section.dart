import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    final imagePaths = [
      AppConstants.screenBudget,
      AppConstants.screenAccounts,
      AppConstants.screenSavings,
      AppConstants.screenAccounts,
      AppConstants.screenBudget,
      AppConstants.screenShoppingList,
    ];

    return Container(
      width: double.infinity,
      color: AppTheme.surfaceColor,
      child: Column(
        children: [
          // Section header
          Padding(
            padding: EdgeInsets.only(
              top: isMobile ? 56 : 88,
              bottom: isMobile ? 8 : 16,
              left: isMobile ? 20 : (isTablet ? 40 : 80),
              right: isMobile ? 20 : (isTablet ? 40 : 80),
            ),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primaryColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        l10n.navFeatures,
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.primaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Feature rows
          ...List.generate(
            l10n.detailedFeatures.length,
            (index) => _FeatureItem(
              feature: {
                ...l10n.detailedFeatures[index],
                'image': imagePaths[index],
              },
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final Map<String, dynamic> feature;
  final int index;

  const _FeatureItem({required this.feature, required this.index});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isImageLeft = index % 2 == 0;

    final bgColor =
        index % 2 == 0 ? AppTheme.surfaceColor : AppTheme.lightSectionBg;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 48 : 80,
      ),
      color: bgColor,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: isMobile || isTablet
              ? _buildMobileLayout(isMobile)
              : _buildDesktopLayout(isImageLeft),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(bool isImageLeft) {
    return Row(
      children: isImageLeft
          ? [
              Expanded(flex: 5, child: _buildImageContent(false)),
              const SizedBox(width: 80),
              Expanded(flex: 5, child: _buildTextContent(false)),
            ]
          : [
              Expanded(flex: 5, child: _buildTextContent(false)),
              const SizedBox(width: 80),
              Expanded(flex: 5, child: _buildImageContent(false)),
            ],
    );
  }

  Widget _buildMobileLayout(bool isMobile) {
    return Column(
      children: [
        _buildImageContent(isMobile),
        SizedBox(height: isMobile ? 32 : 40),
        _buildTextContent(isMobile),
      ],
    );
  }

  Widget _buildImageContent(bool isMobile) {
    return Center(
      child: Container(
        constraints: BoxConstraints(
          maxWidth: isMobile ? 280 : 380,
          maxHeight: isMobile ? 560 : 760,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.12),
            width: 1,
          ),
          boxShadow: [
            // Teal glow
            BoxShadow(
              color: AppTheme.primaryColor.withValues(alpha: 0.16),
              blurRadius: 50,
              spreadRadius: -8,
              offset: const Offset(0, 16),
            ),
            // Base shadow
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.07),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(28),
          child: Image.asset(
            feature['image'] as String,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 600,
                decoration: BoxDecoration(
                  color: AppTheme.lightSectionBg,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Center(
                  child: Icon(
                    Icons.phone_android,
                    size: 80,
                    color: AppTheme.primaryColor,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Index badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            (index + 1).toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppTheme.primaryColor,
              letterSpacing: 1,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          feature['title'] as String,
          style: TextStyle(
            fontSize: isMobile ? 26 : 34,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            height: 1.15,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          feature['subtitle'] as String,
          style: TextStyle(
            fontSize: isMobile ? 15 : 17,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          feature['description'] as String,
          style: TextStyle(
            fontSize: isMobile ? 15 : 16,
            color: AppTheme.textSecondary,
            height: 1.65,
          ),
        ),
        const SizedBox(height: 28),
        ...List.generate(
          (feature['features'] as List<String>).length,
          (itemIndex) => Padding(
            padding: const EdgeInsets.only(bottom: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    gradient: AppTheme.iconGradient,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    (feature['features'] as List<String>)[itemIndex],
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w500,
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
