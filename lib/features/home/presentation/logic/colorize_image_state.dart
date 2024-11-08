part of 'colorize_image_cubit.dart';

sealed class ColorizeImageState extends Equatable {
  const ColorizeImageState();

  @override
  List<Object> get props => [];
}

final class ColorizeImageInitial extends ColorizeImageState {}

final class ColorizeImageLoading extends ColorizeImageState {}

final class ColorizeImageSuccess extends ColorizeImageState {
  final Uint8List colorizedImageBytes;

  const ColorizeImageSuccess(this.colorizedImageBytes);
}

final class ColorizeImageError extends ColorizeImageState {
  final String errorMessage;

  const ColorizeImageError(this.errorMessage);
}
