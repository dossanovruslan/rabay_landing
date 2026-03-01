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
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => context.maybePop(),
          icon: const Icon(Icons.arrow_back, color: AppTheme.textPrimary),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppTheme.textPrimary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 980),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 28),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: _buildStyledHtmlContent(contentBlocks),
                ),
              ),
            ),
          ),
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
            padding: const EdgeInsets.only(top: 10, bottom: 14),
            child: Divider(
              color: Colors.grey.withValues(alpha: 0.25),
              height: 1,
            ),
          ),
        );
      }

      if (block.type == 'li') {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    '${block.listPrefix ?? '•'} ',
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppTheme.textPrimary,
                      fontWeight: FontWeight.w600,
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

      widgets.add(
        Padding(
          padding: EdgeInsets.only(
            top: isHeading1
                ? 10
                : isHeading2
                ? 6
                : isHeading3
                ? 4
                : 0,
            bottom: isHeading1
                ? 10
                : isHeading2
                ? 8
                : isHeading3
                ? 6
                : 12,
          ),
          child: Text(
            block.text,
            textAlign: isHeading1 || isHeading2 || isHeading3
                ? TextAlign.left
                : TextAlign.justify,
            style: TextStyle(
              fontSize: isHeading1
                  ? 28
                  : isHeading2
                  ? 21
                  : isHeading3
                  ? 18
                  : 15,
              fontWeight: isHeading1 || isHeading2 || isHeading3
                  ? FontWeight.w700
                  : FontWeight.w400,
              color: isHeading1 || isHeading2 || isHeading3
                  ? AppTheme.primaryColor
                  : AppTheme.textPrimary,
              height: isHeading1
                  ? 1.2
                  : isHeading2
                  ? 1.3
                  : isHeading3
                  ? 1.35
                  : 1.7,
            ),
          ),
        ),
      );

      if (index == blocks.length - 1) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Конец документа',
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary.withValues(alpha: 0.8),
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
