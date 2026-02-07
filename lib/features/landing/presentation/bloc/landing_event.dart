import 'package:equatable/equatable.dart';

abstract class LandingEvent extends Equatable {
  const LandingEvent();

  @override
  List<Object?> get props => [];
}

class LoadScreenshots extends LandingEvent {
  const LoadScreenshots();
}

class ChangeScreenshot extends LandingEvent {
  final int index;

  const ChangeScreenshot(this.index);

  @override
  List<Object?> get props => [index];
}

class OpenStoreLink extends LandingEvent {
  final String url;

  const OpenStoreLink(this.url);

  @override
  List<Object?> get props => [url];
}

class OpenSocialLink extends LandingEvent {
  final String url;

  const OpenSocialLink(this.url);

  @override
  List<Object?> get props => [url];
}
