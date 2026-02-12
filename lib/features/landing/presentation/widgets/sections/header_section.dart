import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../../core/theme/app_theme.dart';
import '../../../../../core/constants/app_constants.dart';

class HeaderSection extends StatefulWidget {
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
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    // Listen to scroll events to change header background
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final scrollController = Scrollable.of(context).widget.controller;
      scrollController?.addListener(_onScroll);
    });
  }

  void _onScroll() {
    final scrollController = Scrollable.of(context).widget.controller;
    if (scrollController != null) {
      if (scrollController.offset > 100 && !_isScrolled) {
        setState(() => _isScrolled = true);
      } else if (scrollController.offset <= 100 && _isScrolled) {
        setState(() => _isScrolled = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;

    return FadeInDown(
      duration: const Duration(milliseconds: 800),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: _isScrolled
              ? Colors.white.withOpacity(0.95)
              : Colors.white.withOpacity(0),
          boxShadow: _isScrolled
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 1200,
              minHeight: isMobile ? 56 : 180,
            ),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withAlpha(220),
              borderRadius: BorderRadius.circular(14),
            ),

            // margin: EdgeInsets.only(top: isMobile ? 12 : 24),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : (isTablet ? 32 : 64),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Logo
                _buildLogo(isMobile),

                // Navigation Menu
                if (!isMobile && !isTablet)
                  _buildDesktopMenu()
                else
                  _buildMobileMenuButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(bool isMobile) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.primaryColor, AppTheme.primaryDark],
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.account_balance_wallet_rounded,
            color: Colors.white,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        if (!isMobile)
          Text(
            AppConstants.appName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: _isScrolled ? AppTheme.textPrimary : Colors.white,
            ),
          ),
      ],
    );
  }

  Widget _buildDesktopMenu() {
    return Row(
      children: [
        _buildMenuItem('Главная', widget.heroKey),
        const SizedBox(width: 32),
        _buildMenuItem('Возможности', widget.featuresKey),
        const SizedBox(width: 32),
        _buildMenuItem('Реферальная программа', widget.referralKey),
        const SizedBox(width: 32),
        _buildMenuItem('О нас', widget.aboutKey),
      ],
    );
  }

  Widget _buildMenuItem(String title, GlobalKey key) {
    return InkWell(
      onTap: () => widget.onNavigate(key),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: _isScrolled ? AppTheme.textPrimary : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMobileMenuButton() {
    return IconButton(
      icon: Icon(
        Icons.menu,
        color: _isScrolled ? AppTheme.textPrimary : Colors.white,
      ),
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
            _buildMobileMenuItem('Главная', widget.heroKey, context),
            const Divider(),
            _buildMobileMenuItem('Возможности', widget.featuresKey, context),
            const Divider(),
            _buildMobileMenuItem(
              'Реферальная программа',
              widget.referralKey,
              context,
            ),
            const Divider(),
            _buildMobileMenuItem('О нас', widget.aboutKey, context),
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
        widget.onNavigate(key);
      },
    );
  }
}
