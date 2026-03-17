import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart' as html_parser;
import '../../../../../core/constants/terms.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/theme/app_theme.dart';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LegalDocumentPage(documentKey: 'privacyPolicy');
  }
}

@RoutePage()
class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LegalDocumentPage(documentKey: 'termsOfService');
  }
}

class _LegalDocumentPage extends StatelessWidget {
  final String documentKey;

  const _LegalDocumentPage({required this.documentKey});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isPrivacy = documentKey == 'privacyPolicy';
    final title = _localizedTitle(
      languageCode: l10n.languageCode,
      isPrivacy: isPrivacy,
    );
    final htmlContent = getLocalizedTermsContent(
      contentKey: documentKey,
      languageCode: l10n.languageCode,
    );
    final contentBlocks = _extractHtmlBlocks(htmlContent);

    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context, title, isPrivacy),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFE8EDF3)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.04),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(32),
                        child: _buildStyledHtmlContent(contentBlocks),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar(
    BuildContext context,
    String title,
    bool isPrivacy,
  ) {
    final icon = isPrivacy
        ? Icons.privacy_tip_rounded
        : Icons.description_rounded;

    return SliverAppBar(
      expandedHeight: 160.0,
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
            // Orb
            Positioned(
              right: -80,
              top: -60,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppTheme.primaryColor.withValues(alpha: 0.18),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),
            // Title content
            Positioned(
              bottom: 24,
              left: 72,
              right: 20,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withValues(alpha: 0.20),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppTheme.primaryColor.withValues(alpha: 0.30),
                      ),
                    ),
                    child: Icon(icon, color: AppTheme.primaryColor, size: 22),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static String _localizedTitle({
    required String languageCode,
    required bool isPrivacy,
  }) {
    if (languageCode == 'en') {
      return isPrivacy ? 'Privacy Policy' : 'Terms of Service';
    }
    if (languageCode == 'kk') {
      return isPrivacy ? 'Құпиялылық саясаты' : 'Пайдаланушы келісімі';
    }
    if (languageCode == 'uk') {
      return isPrivacy ? 'Політика конфіденційності' : 'Користувацька угода';
    }
    return isPrivacy
        ? 'Политика конфиденциальности'
        : 'Пользовательское соглашение';
  }

  static Widget _buildStyledHtmlContent(List<_HtmlBlock> blocks) {
    if (blocks.isEmpty) {
      return const Text(
        'Документ временно недоступен',
        style: TextStyle(fontSize: 16, color: AppTheme.textSecondary),
      );
    }

    final widgets = <Widget>[];

    for (var index = 0; index < blocks.length; index++) {
      final block = blocks[index];
      final isHeading1 = block.type == 'h1';
      final isHeading2 = block.type == 'h2';
      final isHeading3 = block.type == 'h3';

      if (isHeading2 && widgets.isNotEmpty) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 16),
            child: Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor.withValues(alpha: 0.30),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        );
      }

      if (block.type == 'li') {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 9),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, right: 10),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: block.listPrefix != null &&
                              block.listPrefix != '•'
                          ? AppTheme.primaryColor
                          : AppTheme.primaryColor.withValues(alpha: 0.50),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                if (block.listPrefix != null && block.listPrefix != '•')
                  Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: Text(
                      block.listPrefix!,
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w700,
                        height: 1.7,
                      ),
                    ),
                  ),
                Expanded(
                  child: Text(
                    block.text,
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppTheme.textPrimary,
                      height: 1.7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        continue;
      }

      if (isHeading1) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 14),
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (bounds) =>
                  AppTheme.primaryGradient.createShader(bounds),
              child: Text(
                block.text,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  height: 1.25,
                ),
              ),
            ),
          ),
        );
        continue;
      }

      if (isHeading2) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 4,
                  height: 20,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                Expanded(
                  child: Text(
                    block.text,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        continue;
      }

      if (isHeading3) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 8),
            child: Text(
              block.text,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary,
                height: 1.35,
              ),
            ),
          ),
        );
        continue;
      }

      widgets.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            block.text,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
              color: AppTheme.textSecondary,
              height: 1.75,
            ),
          ),
        ),
      );

      if (index == blocks.length - 1) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.primaryColor.withValues(alpha: 0.15),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle_outline_rounded,
                    size: 16,
                    color: AppTheme.primaryColor.withValues(alpha: 0.70),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Конец документа',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.primaryColor.withValues(alpha: 0.70),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widgets,
    );
  }

  static List<_HtmlBlock> _extractHtmlBlocks(String html) {
    final document = html_parser.parse(html);
    document
        .querySelectorAll('style, script, noscript, template')
        .forEach((node) => node.remove());
    final root = document.body ?? document.documentElement;
    final nodes = root?.querySelectorAll('h1, h2, h3, p, li') ?? const [];
    final orderedListCounters = Expando<int>();

    return nodes
        .map((node) {
          final type = node.localName?.toLowerCase() ?? 'p';
          String? listPrefix;

          if (type == 'li') {
            final parent = node.parent;
            if (parent != null && parent.localName?.toLowerCase() == 'ol') {
              final current = (orderedListCounters[parent] ?? 0) + 1;
              orderedListCounters[parent] = current;
              listPrefix = '$current.';
            } else {
              listPrefix = '•';
            }
          }

          final clean = node.text
              .replaceAll('\u00A0', ' ')
              .replaceAll(RegExp(r'\s+'), ' ')
              .trim();
          if (clean.isEmpty) {
            return null;
          }
          return _HtmlBlock(type: type, text: clean, listPrefix: listPrefix);
        })
        .whereType<_HtmlBlock>()
        .toList();
  }
}

class _HtmlBlock {
  final String type;
  final String text;
  final String? listPrefix;

  const _HtmlBlock({required this.type, required this.text, this.listPrefix});
}
