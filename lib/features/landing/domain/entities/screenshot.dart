import 'package:equatable/equatable.dart';

class Screenshot extends Equatable {
  final String path;
  final int index;

  const Screenshot({required this.path, required this.index});

  @override
  List<Object?> get props => [path, index];
}
