import 'package:equatable/equatable.dart';
import '../../domain/entities/screenshot.dart';

enum LandingStatus { initial, loading, loaded, error }

class LandingState extends Equatable {
  final LandingStatus status;
  final List<Screenshot> screenshots;
  final int currentScreenshotIndex;
  final String? errorMessage;

  const LandingState({
    this.status = LandingStatus.initial,
    this.screenshots = const [],
    this.currentScreenshotIndex = 0,
    this.errorMessage,
  });

  LandingState copyWith({
    LandingStatus? status,
    List<Screenshot>? screenshots,
    int? currentScreenshotIndex,
    String? errorMessage,
  }) {
    return LandingState(
      status: status ?? this.status,
      screenshots: screenshots ?? this.screenshots,
      currentScreenshotIndex:
          currentScreenshotIndex ?? this.currentScreenshotIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    screenshots,
    currentScreenshotIndex,
    errorMessage,
  ];
}
