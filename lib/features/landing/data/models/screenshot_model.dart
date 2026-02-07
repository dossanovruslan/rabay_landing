import '../../domain/entities/screenshot.dart';

class ScreenshotModel extends Screenshot {
  const ScreenshotModel({required super.path, required super.index});

  factory ScreenshotModel.fromPath(String path, int index) {
    return ScreenshotModel(path: path, index: index);
  }
}
