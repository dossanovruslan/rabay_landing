import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/theme/app_theme.dart';
import '../bloc/landing_bloc.dart';
import '../bloc/landing_event.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;
    final isTablet = size.width > 600 && size.width <= 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : (isTablet ? 40 : 20),
        vertical: isDesktop ? 60 : 40,
      ),
      decoration: BoxDecoration(
        color: AppTheme.textPrimary,
        border: Border(
          top: BorderSide(
            color: AppTheme.primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
      ),
      child: Column(
        children: [
          // Social Media
          Wrap(
            spacing: 24,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.instagram,
                onTap: () {
                  context.read<LandingBloc>().add(
                    const OpenSocialLink(AppConstants.instagramUrl),
                  );
                },
              ),
              _SocialButton(
                icon: FontAwesomeIcons.facebook,
                onTap: () {
                  context.read<LandingBloc>().add(
                    const OpenSocialLink(AppConstants.facebookUrl),
                  );
                },
              ),
              _SocialButton(
                icon: FontAwesomeIcons.telegram,
                onTap: () {
                  context.read<LandingBloc>().add(
                    const OpenSocialLink(AppConstants.telegramUrl),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Legal Links
          Wrap(
            spacing: isDesktop ? 32 : 16,
            runSpacing: 16,
            alignment: WrapAlignment.center,
            children: [
              _FooterLink(
                text: 'Политика конфиденциальности',
                onTap: () {
                  context.read<LandingBloc>().add(
                    const OpenSocialLink(AppConstants.privacyPolicyUrl),
                  );
                },
              ),
              _FooterLink(
                text: 'Условия использования',
                onTap: () {
                  context.read<LandingBloc>().add(
                    const OpenSocialLink(AppConstants.termsOfServiceUrl),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Copyright
          Text(
            '© 2025 RaBay. Все права защищены.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _SocialButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Center(child: FaIcon(icon, color: Colors.white, size: 20)),
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _FooterLink({required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white.withOpacity(0.8),
          fontSize: 14,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}
