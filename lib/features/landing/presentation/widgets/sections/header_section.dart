import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/localization/app_localizations.dart';

class HeaderSection extends StatelessWidget {
  final Function(GlobalKey) onNavigate;
  final GlobalKey heroKey;
  final GlobalKey featuresKey;
  final GlobalKey referralKey;
  final GlobalKey aboutKey;
  final Locale currentLocale;
  final ValueChanged<Locale> onLocaleChanged;

  const HeaderSection({
    super.key,
    required this.onNavigate,
    required this.heroKey,
    required this.featuresKey,
    required this.referralKey,
    required this.aboutKey,
    required this.currentLocale,
    required this.onLocaleChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final l10n = AppLocalizations.of(context);

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
              _buildLogo(isMobile, l10n),
              if (!isMobile && !isTablet)
                _buildDesktopMenu(l10n)
              else
                Row(
                  children: [
                    _buildLanguageSelector(isCompact: true),
                    const SizedBox(width: 8),
                    _buildMobileMenuButton(context),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(bool isMobile, AppLocalizations l10n) {
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
            l10n.appName,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopMenu(AppLocalizations l10n) {
    return Row(
      children: [
        _buildMenuItem(l10n.navHome, heroKey),
        const SizedBox(width: 28),
        _buildMenuItem(l10n.navFeatures, featuresKey),
        const SizedBox(width: 28),
        _buildMenuItem(l10n.navReferral, referralKey),
        const SizedBox(width: 28),
        _buildMenuItem(l10n.navAbout, aboutKey),
        const SizedBox(width: 24),
        _buildLanguageSelector(),
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
    final l10n = AppLocalizations.of(context);

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
            _buildMobileMenuItem(l10n.navHome, heroKey, context),
            const Divider(),
            _buildMobileMenuItem(l10n.navFeatures, featuresKey, context),
            const Divider(),
            _buildMobileMenuItem(l10n.navReferral, referralKey, context),
            const Divider(),
            _buildMobileMenuItem(l10n.navAbout, aboutKey, context),
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

  Widget _buildLanguageSelector({bool isCompact = false}) {
    final buttonRadius = BorderRadius.circular(14);

    return PopupMenuButton<Locale>(
      tooltip: 'Language',
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      offset: Offset(0, isCompact ? 40 : 44),
      onSelected: onLocaleChanged,
      itemBuilder: (_) => const [
        PopupMenuItem(value: Locale('ru'), child: Text('Русский')),
        PopupMenuItem(value: Locale('en'), child: Text('English')),
        PopupMenuItem(value: Locale('kk'), child: Text('Қазақша')),
        PopupMenuItem(value: Locale('uk'), child: Text('Українська')),
        PopupMenuItem(value: Locale('be'), child: Text('Беларуская')),
        PopupMenuItem(value: Locale('ky'), child: Text('Кыргызча')),
        PopupMenuItem(value: Locale('uz'), child: Text('Oʻzbekcha')),
        PopupMenuItem(value: Locale('tg'), child: Text('Тоҷикӣ')),
        PopupMenuItem(value: Locale('hy'), child: Text('Հայերեն')),
        PopupMenuItem(value: Locale('ro'), child: Text('Moldovenească')),
      ],
      color: Colors.white,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: isCompact ? 34 : 38,
        constraints: BoxConstraints(minWidth: isCompact ? 64 : 74),
        padding: EdgeInsets.symmetric(horizontal: isCompact ? 10 : 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: buttonRadius,
          border: Border.all(
            color: AppTheme.primaryColor.withValues(alpha: 0.25),
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.language_rounded,
              size: isCompact ? 15 : 16,
              color: AppTheme.primaryColor,
            ),
            SizedBox(width: isCompact ? 5 : 6),
            Text(
              currentLocale.languageCode.toUpperCase(),
              style: TextStyle(
                fontSize: isCompact ? 11.5 : 12,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(width: 1),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: isCompact ? 16 : 18,
              color: AppTheme.textSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
