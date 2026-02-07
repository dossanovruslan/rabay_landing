import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/constants/app_constants.dart';
import '../../../../../../core/theme/app_theme.dart';
import '../common/section_title.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 80),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isDesktop ? 120 : 24),
            child: const SectionTitle(
              title: 'Что говорят пользователи',
              subtitle: 'Реальные истории успеха',
            ),
          ),
          const SizedBox(height: 60),
          CarouselSlider(
            options: CarouselOptions(
              height: 350,
              viewportFraction: isDesktop ? 0.3 : 0.85,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 5),
              enlargeCenterPage: true,
            ),
            items: AppConstants.testimonials.map((testimonial) {
              return Builder(
                builder: (BuildContext context) {
                  return _buildTestimonialCard(context, testimonial);
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildTestimonialCard(
    BuildContext context,
    Map<String, String> testimonial,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  testimonial['avatar']!,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    testimonial['name']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    testimonial['role']!,
                    style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Text(
              '"${testimonial['text']}"',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
                height: 1.6,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          const Icon(
            Icons.format_quote,
            color: AppTheme.primaryColor,
            size: 40,
          ),
        ],
      ),
    );
  }
}
