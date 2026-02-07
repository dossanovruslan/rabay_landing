import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/landing_bloc.dart';
import '../bloc/landing_event.dart';
import '../widgets/hero_section.dart';
import '../widgets/features_section.dart';
import '../widgets/screenshots_section.dart';
import '../widgets/download_section.dart';
import '../widgets/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingBloc()..add(const LoadScreenshots()),
      child: const Scaffold(body: _LandingPageBody()),
    );
  }
}

class _LandingPageBody extends StatelessWidget {
  const _LandingPageBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          HeroSection(),
          FeaturesSection(),
          ScreenshotsSection(),
          DownloadSection(),
          FooterSection(),
        ],
      ),
    );
  }
}
