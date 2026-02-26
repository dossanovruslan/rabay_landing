import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';

class HeaderSection extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey heroKey;
  final GlobalKey featuresKey;
  final GlobalKey referralKey;
  final GlobalKey aboutKey;

  const HeaderSection({
    super.key,
    required this.onNavigate,
    required this.heroKey,
    required this.featuresKey,
    required this.referralKey,
    required this.aboutKey,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return Container(
      height: 84,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.96),
        border: Border(
          bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.15)),
        ),
      ),
      child: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1200),
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : (isTablet ? 32 : 48),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLogo(isMobile),
              if (!isMobile && !isTablet)
                _buildDesktopMenu()
              else
                _buildMobileMenuButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(bool isMobile) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.account_balance_wallet_rounded,
            color: AppTheme.primaryColor,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        if (!isMobile)
          Text(
            AppConstants.appName,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        _buildMenuItem('Главная', heroKey),
        const SizedBox(width: 28),
        _buildMenuItem('Возможности', featuresKey),
        const SizedBox(width: 28),
        _buildMenuItem('Партнёрство', referralKey),
        const SizedBox(width: 28),
        _buildMenuItem('О нас', aboutKey),
      ],
    );
  }

  Widget _buildMenuItem(String title, GlobalKey key) {
    return InkWell(
      onTap: () => onNavigate(key),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: AppTheme.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenuButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
      onPressed: () {
        _showMobileMenu(context);
      },
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildMobileMenuItem('Главная', heroKey, context),
            const Divider(),
            _buildMobileMenuItem('Возможности', featuresKey, context),
            const Divider(),
            _buildMobileMenuItem('Партнёрство', referralKey, context),
            const Divider(),
            _buildMobileMenuItem('О нас', aboutKey, context),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileMenuItem(
    String title,
    GlobalKey key,
    BuildContext context,
  ) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Navigator.pop(context);
        onNavigate(key);
      },
    );
  }
}
