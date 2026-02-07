import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animate_do/animate_do.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/theme/app_theme.dart';
import '../bloc/landing_bloc.dart';
import '../bloc/landing_event.dart';
import '../bloc/landing_state.dart';

class ScreenshotsSection extends StatefulWidget {
  const ScreenshotsSection({super.key});

  @override
  State<ScreenshotsSection> createState() => _ScreenshotsSectionState();
}

class _ScreenshotsSectionState extends State<ScreenshotsSection> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 80 : (isTablet ? 60 : 40),
      ),
      child: Column(
        children: [
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            child: Text(
              'Скриншоты',
              style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontSize: isDesktop ? 48 : (isTablet ? 36 : 28),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            duration: const Duration(milliseconds: 800),
            delay: const Duration(milliseconds: 200),
            child: Text(
              'Посмотрите, как работает приложение',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(fontSize: isDesktop ? 18 : 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 60),
          BlocBuilder<LandingBloc, LandingState>(
            builder: (context, state) {
              if (state.status == LandingStatus.loaded &&
                  state.screenshots.isNotEmpty) {
                return Column(
                  children: [
                    SizedBox(
                      height: isDesktop ? 600 : (isTablet ? 500 : 550),
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          context.read<LandingBloc>().add(
                            ChangeScreenshot(index),
                          );
                        },
                        itemCount: state.screenshots.length,
                        itemBuilder: (context, index) {
                          return FadeIn(
                            duration: const Duration(milliseconds: 500),
                            child: Center(
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: isDesktop ? 400 : 350,
                                  maxHeight: isDesktop ? 600 : 550,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppTheme.primaryColor.withOpacity(
                                        0.2,
                                      ),
                                      blurRadius: 40,
                                      spreadRadius: 0,
                                      offset: const Offset(0, 20),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(32),
                                  child: Image.asset(
                                    state.screenshots[index].path,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 40),
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: state.screenshots.length,
                      effect: WormEffect(
                        dotWidth: 12,
                        dotHeight: 12,
                        activeDotColor: AppTheme.primaryColor,
                        dotColor: AppTheme.textSecondary.withOpacity(0.3),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
