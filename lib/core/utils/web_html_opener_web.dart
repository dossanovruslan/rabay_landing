// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:async';
import 'dart:html' as html;

Future<bool> openHtmlInNewTab(String htmlContent) async {
  final blob = html.Blob([htmlContent], 'text/html;charset=utf-8');
  final blobUrl = html.Url.createObjectUrlFromBlob(blob);
  html.window.open(blobUrl, '_blank');

  Future<void>.delayed(const Duration(seconds: 30), () {
    html.Url.revokeObjectUrl(blobUrl);
  });

  return true;
}
