import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Column(
        children: List.generate(
          AppConstants.detailedFeatures.length,
          (index) => _FeatureItem(
            feature: AppConstants.detailedFeatures[index],
            index: index,
          ),
        ),
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

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 20 : (isTablet ? 40 : 80),
        vertical: isMobile ? 40 : 80,
      ),
      color: index % 2 == 0 ? Colors.white : AppTheme.lightSectionBg,
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
    return FadeIn(
      duration: const Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: isMobile ? 300 : 400,
            maxHeight: isMobile ? 600 : 800,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryColor.withOpacity(0.2),
                blurRadius: 30,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              feature['image'] as String,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 600,
                  decoration: BoxDecoration(
                    color: AppTheme.lightSectionBg,
                    borderRadius: BorderRadius.circular(30),
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
      ),
    );
  }

  Widget _buildTextContent(bool isMobile) {
    return FadeIn(
      duration: const Duration(milliseconds: 1000),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          Text(
            feature['title'] as String,
            style: TextStyle(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 12),

          // Subtitle
          Text(
            feature['subtitle'] as String,
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryColor,
            ),
          ),
          const SizedBox(height: 24),

          // Description
          Text(
            feature['description'] as String,
            style: TextStyle(
              fontSize: isMobile ? 15 : 16,
              color: AppTheme.textSecondary,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 32),

          // Features list
          ...List.generate(
            (feature['features'] as List<String>).length,
            (index) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: const Icon(
                      Icons.check_circle,
                      color: AppTheme.primaryColor,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      (feature['features'] as List<String>)[index],
                      style: const TextStyle(
                        fontSize: 15,
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
