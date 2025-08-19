part of 'customize_accessory_cubit.dart';

class CustomizeAccessoryState {
  final List<String> accessories;
  final bool previewMode;
  final int currentIndex;
  final int braceletCarouselCurrentIndex;

  CustomizeAccessoryState(
    this.accessories,
    this.previewMode,
    this.currentIndex,
    this.braceletCarouselCurrentIndex,
  );

  CustomizeAccessoryState copyWith({
    List<String>? accessories,
    bool? previewMode,
    int? currentIndex,
    int? braceletCarouselCurrentIndex,
  }) {
    return CustomizeAccessoryState(
      accessories ?? this.accessories,
      previewMode ?? this.previewMode,
      currentIndex ?? this.currentIndex,
      braceletCarouselCurrentIndex ?? this.braceletCarouselCurrentIndex,
    );
  }
}
