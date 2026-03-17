import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:auto_route/auto_route.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/app_theme.dart';
import '../widgets/common/app_button.dart';

@RoutePage()
class ReferralDetailsPage extends StatelessWidget {
  const ReferralDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final l10n = AppLocalizations.of(context);
    final content = _ReferralDetailsContent.forLocale(l10n.languageCode);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, content),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : (isTablet ? 32 : 60),
              vertical: isMobile ? 24 : 36,
            ),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _LevelsSection(content: content, isMobile: isMobile),
                        SizedBox(height: isMobile ? 24 : 32),
                        _MlmExplanationSection(content: content),
                        SizedBox(height: isMobile ? 24 : 32),
                        _StepsToStartSection(content: content),
                        SizedBox(height: isMobile ? 24 : 32),
                        _CustomPercentSection(content: content),
                        SizedBox(height: isMobile ? 24 : 32),
                        _ExtraInfoSection(content: content),
                        SizedBox(height: isMobile ? 32 : 48),
                        Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 400),
                            child: AppButton(
                              text: content.btnOpenApp,
                              icon: Icons.open_in_new_rounded,
                              onPressed: () =>
                                  _launchUrl(AppConstants.appStoreUrl),
                              backgroundColor: AppTheme.primaryColor,
                              textColor: Colors.white,
                              isFullWidth: true,
                            ),
                          ),
                        ),
                        const SizedBox(height: 48),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(
    BuildContext context,
    _ReferralDetailsContent content,
  ) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;

    return SliverAppBar(
      expandedHeight: isMobile ? 200.0 : 240.0,
      pinned: true,
      backgroundColor: AppTheme.heroBackground,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        onPressed: () => context.maybePop(),
        icon: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: Stack(
          fit: StackFit.expand,
          children: [
            // Gradient background
            Container(
              decoration: const BoxDecoration(gradient: AppTheme.heroGradient),
            ),
            // Orb top right
            Positioned(
              right: -80,
              top: -60,
              child: Container(
                width: 280,
                height: 280,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primaryColor.withValues(alpha: 0.20),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Orb bottom left
            Positioned(
              left: -60,
              bottom: -40,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primaryColor.withValues(alpha: 0.12),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Content
            Positioned(
              bottom: 28,
              left: 72,
              right: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.20),
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                        color: AppTheme.primaryColor.withValues(alpha: 0.35),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'MLM',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.primaryColor,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    content.pageTitle,
                    style: TextStyle(
                      fontSize: isMobile ? 22 : 26,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    content.subtitle,
                    style: TextStyle(
                      fontSize: isMobile ? 13 : 14,
                      color: Colors.white.withValues(alpha: 0.68),
                      height: 1.5,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      debugPrint('Could not launch $url');
    }
  }
}

class _LevelsSection extends StatelessWidget {
  final _ReferralDetailsContent content;
  final bool isMobile;
  const _LevelsSection({required this.content, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    final cards = [
      _LevelCard(percent: '8%', title: content.level1Title, desc: content.level1Desc, index: 0),
      _LevelCard(percent: '4%', title: content.level2Title, desc: content.level2Desc, index: 1),
      _LevelCard(percent: '2%', title: content.level3Title, desc: content.level3Desc, index: 2),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          content.levelsTitle,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 16),
        if (isMobile)
          Column(
            children: cards
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: c,
                  ),
                )
                .toList(),
          )
        else
          Row(
            children: cards
                .map(
                  (c) => Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: c != cards.last ? 16 : 0),
                      child: c,
                    ),
                  ),
                )
                .toList(),
          ),
      ],
    );
  }
}

class _LevelCard extends StatelessWidget {
  final String percent;
  final String title;
  final String desc;
  final int index;

  const _LevelCard({
    required this.percent,
    required this.title,
    required this.desc,
    required this.index,
  });

  static const _accents = [
    Color(0xFF038AA6),
    Color(0xFF0560C9),
    Color(0xFF7C3AED),
  ];

  @override
  Widget build(BuildContext context) {
    final accent = _accents[index % _accents.length];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: accent.withValues(alpha: 0.18)),
        boxShadow: [
          BoxShadow(
            color: accent.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => LinearGradient(
              colors: [accent, accent.withValues(alpha: 0.75)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              percent,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.w900,
                height: 1.0,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            desc,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _MlmExplanationSection extends StatelessWidget {
  final _ReferralDetailsContent content;
  const _MlmExplanationSection({required this.content});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      icon: Icons.hub_outlined,
      title: content.mlmTitle,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            content.mlmDesc,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textSecondary,
              height: 1.65,
            ),
          ),
          const SizedBox(height: 16),
          ...content.mlmBenefits.map(
            (benefit) => Padding(
              padding: const EdgeInsets.only(bottom: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 2),
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      gradient: AppTheme.iconGradient,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      benefit,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppTheme.textPrimary,
                        height: 1.55,
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

class _StepsToStartSection extends StatelessWidget {
  final _ReferralDetailsContent content;
  const _StepsToStartSection({required this.content});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      icon: Icons.rocket_launch_rounded,
      title: content.stepsTitle,
      child: Column(
        children: List.generate(
          content.steps.length,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      content.steps[index],
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppTheme.textPrimary,
                        height: 1.55,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomPercentSection extends StatelessWidget {
  final _ReferralDetailsContent content;
  const _CustomPercentSection({required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: AppTheme.ctaGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          // Decorative orb
          Positioned(
            right: -40,
            top: -40,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.06),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.stars_rounded,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      content.proTitle,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                content.proDesc,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withValues(alpha: 0.80),
                  height: 1.55,
                ),
              ),
              const SizedBox(height: 16),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () async {
                    final url = Uri.parse('https://instagram.com/rabay.kz');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.camera_alt_rounded,
                          size: 18,
                          color: AppTheme.primaryDark,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          content.proInsta,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            color: AppTheme.primaryDark,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ExtraInfoSection extends StatelessWidget {
  final _ReferralDetailsContent content;
  const _ExtraInfoSection({required this.content});

  @override
  Widget build(BuildContext context) {
    return _SectionContainer(
      icon: Icons.shield_outlined,
      title: content.extraInfoTitle,
      child: Text(
        content.extraInfoDesc,
        style: const TextStyle(
          fontSize: 15,
          color: AppTheme.textSecondary,
          height: 1.65,
        ),
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;

  const _SectionContainer({
    required this.icon,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE8EDF3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: AppTheme.iconGradient,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryColor.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: AppTheme.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          child,
        ],
      ),
    );
  }
}

class _ReferralDetailsContent {
  final String pageTitle;
  final String subtitle;
  final String levelsTitle;
  final String level1Title;
  final String level1Desc;
  final String level2Title;
  final String level2Desc;
  final String level3Title;
  final String level3Desc;
  final String mlmTitle;
  final String mlmDesc;
  final List<String> mlmBenefits;
  final String stepsTitle;
  final List<String> steps;
  final String proTitle;
  final String proDesc;
  final String proInsta;
  final String extraInfoTitle;
  final String extraInfoDesc;
  final String btnOpenApp;

  const _ReferralDetailsContent({
    required this.pageTitle,
    required this.subtitle,
    required this.levelsTitle,
    required this.level1Title,
    required this.level1Desc,
    required this.level2Title,
    required this.level2Desc,
    required this.level3Title,
    required this.level3Desc,
    required this.mlmTitle,
    required this.mlmDesc,
    required this.mlmBenefits,
    required this.stepsTitle,
    required this.steps,
    required this.proTitle,
    required this.proDesc,
    required this.proInsta,
    required this.extraInfoTitle,
    required this.extraInfoDesc,
    required this.btnOpenApp,
  });

  factory _ReferralDetailsContent.forLocale(String lang) {
    if (lang == 'en') {
      return const _ReferralDetailsContent(
        pageTitle: 'Partner Program',
        subtitle:
            'Earn passive income from premium subscriptions of users you invite through our 3-level MLM referral system.',
        levelsTitle: 'Your Reward Levels',
        level1Title: 'Level 1',
        level1Desc: 'From premium subscriptions of users you invite directly.',
        level2Title: 'Level 2',
        level2Desc:
            'From premium subscriptions of users invited by your Level 1 network.',
        level3Title: 'Level 3',
        level3Desc:
            'From premium subscriptions of users invited by your Level 2 network.',
        mlmTitle: 'Power of the MLM System',
        mlmDesc:
            'Multi-Level Marketing allows you to earn not just from personal recommendations, but from the exponential growth of your entire network.',
        mlmBenefits: [
          'Passive growth: Earn while your network brings in new members.',
          'No income ceiling: The deeper your structure grows, the more you make.',
          'Easy start: No investments, just share your link.',
        ],
        stepsTitle: 'How to Participate',
        steps: [
          'Download the RaBay app.',
          'Go to Profile and tap "Partner Program".',
          'Copy your personal referral link.',
          'Share it with friends and earn % from their Premium Subscriptions.',
        ],
        proTitle: 'Have a Large Audience?',
        proDesc:
            'We offer custom conditions and higher percentages for bloggers and influencers. Contact us in Instagram Direct:',
        proInsta: '@rabay.kz',
        extraInfoTitle: 'Transparency & Payouts',
        extraInfoDesc:
            'All accruals are fully transparent and happen automatically when premium subscriptions are paid. You can withdraw funds anytime conveniently through the app.',
        btnOpenApp: 'Open App',
      );
    }

    return const _ReferralDetailsContent(
      pageTitle: 'Партнерская программа',
      subtitle:
          'Получайте стабильный доход от премиум-подписок пользователей, приглашенных по вашей реферальной ссылке, с нашей 3-уровневой MLM-системой.',
      levelsTitle: 'Ваш заработок',
      level1Title: 'Уровень 1',
      level1Desc: 'С премиум-подписок людей, которых вы пригласили лично.',
      level2Title: 'Уровень 2',
      level2Desc: 'С премиум-подписок тех, кого пригласили ваши друзья.',
      level3Title: 'Уровень 3',
      level3Desc: 'С премиум-подписок пользователей третьего уровня.',
      mlmTitle: 'В чем сила MLM-системы?',
      mlmDesc:
          'Многоуровневая партнерская система поощряет не только ваши личные приглашения, но и активность всей вашей структуры.',
      mlmBenefits: [
        'Пассивный доход: Вы продолжаете зарабатывать, даже когда сеть развивают другие люди.',
        'Доход без потолка: Чем шире и глубже ваша структура, тем выше проценты и вознаграждения.',
        'Честный и легкий старт: Никаких вложений, заработок идет с реальных премиум-подписок.',
      ],
      stepsTitle: 'Как начать зарабатывать?',
      steps: [
        'Установите приложение RaBay.',
        'Зайдите в Профиль -> откройте раздел «Партнерская программа».',
        'Скопируйте вашу персональную реферальную ссылку.',
        'Делитесь ею с друзьями и получайте процент от их подписок.',
      ],
      proTitle: 'Вы блогер или лидер мнений?',
      proDesc:
          'Если у вас есть лояльная аудитория, мы предоставим вам индивидуальные условия с повышенными процентами. Напишите нам в Instagram Direct:',
      proInsta: '@rabay.kz',
      extraInfoTitle: 'Прозрачность и выплаты',
      extraInfoDesc:
          'Все начисления прозрачны и происходят автоматически сразу после оплаты премиум-подписки. Вы можете вывести заработанные средства прямо в приложении на свой счет.',
      btnOpenApp: 'Перейти в приложение',
    );
  }
}
