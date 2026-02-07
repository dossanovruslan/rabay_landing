import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/landing_bloc.dart';
import '../bloc/landing_event.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/problem_solution_section.dart';
import '../widgets/sections/features_section.dart';
import '../widgets/sections/how_it_works_section.dart';
import '../widgets/sections/testimonials_section.dart';
import '../widgets/sections/pricing_section.dart';
import '../widgets/sections/faq_section.dart';
import '../widgets/sections/footer_section.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LandingBloc()..add(const LoadScreenshots()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: _LandingPageBody(),
      ),
    );
  }
}

class _LandingPageBody extends StatelessWidget {
  const _LandingPageBody();

  @override
  Widget build(BuildContext context) {
    // Add a scrollbar for better UX on web
    return Scrollbar(
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: const [
            HeroSection(),
            ProblemSolutionSection(),
            FeaturesSection(),
            HowItWorksSection(),
            TestimonialsSection(),
            // PricingSection(),
            FaqSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}
