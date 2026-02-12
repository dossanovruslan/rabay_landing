import 'package:flutter/material.dart';
import '../widgets/sections/header_section.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/benefits_section.dart';
import '../widgets/sections/features_section.dart';
import '../widgets/sections/referral_section.dart';
import '../widgets/sections/cta_section.dart';
import '../widgets/sections/about_section.dart';
import '../widgets/sections/footer_section.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey heroKey = GlobalKey();
  final GlobalKey featuresKey = GlobalKey();
  final GlobalKey referralKey = GlobalKey();
  final GlobalKey aboutKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Hero Section (with its own background)
                Container(key: heroKey, child: const HeroSection()),

                // Benefits Section
                const BenefitsSection(),

                // Features Section
                Container(key: featuresKey, child: const FeaturesSection()),

                // Referral Section
                Container(key: referralKey, child: const ReferralSection()),

                // CTA Section
                const CtaSection(),

                // About Section
                Container(key: aboutKey, child: const AboutSection()),

                // Footer
                const FooterSection(),
              ],
            ),
          ),

          // Sticky Header
          HeaderSection(
            onNavigate: _scrollToSection,
            heroKey: heroKey,
            featuresKey: featuresKey,
            referralKey: referralKey,
            aboutKey: aboutKey,
          ),
        ],
      ),
    );
  }
}
