import 'dart:developer' as dev;
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'customize_accessory_state.dart';

class CustomizeAccessoryCubit extends Cubit<CustomizeAccessoryState> {
  CustomizeAccessoryCubit()
    : super(CustomizeAccessoryState(List.filled(9, ""), false, -1, 0));

  Uint8List? customizedImage;

  final List<Map<String, String>> bracelets = [
    {"name": "Classic Gold", "image": "assets/images/access1.png"},
    {"name": "Silver Charm", "image": "assets/images/access2.png"},
    {"name": "Leather Style", "image": "assets/images/access1.png"},
  ];

  String? selectedBracelet;

  List<String> letters = [
    'assets/images/a_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
    'assets/images/b_letter.png',
  ];

  List<String> titles = [
    'INITIAL CHARMS',
    'GOLD CHARMS',
    'COLORED CHARMS',
    'PEARLS & MOTHER OF PEARL',
  ];

  void updateBraceletCurrentIndex(int index) {
    emit(state.copyWith(braceletCarouselCurrentIndex: index));
  }

  void submitBracelet() {
    selectedBracelet = bracelets[state.braceletCarouselCurrentIndex]['image'];
  }

  void updateAccessory(int index, String image) {
    final updated = List<String>.from(state.accessories);
    updated[index] = image;
    emit(state.copyWith(accessories: updated));
  }

  void togglePreview() {
    emit(state.copyWith(previewMode: !state.previewMode));
  }

  void selectedButton(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void reset() {
    emit(
      state.copyWith(
        accessories: List.filled(9, ""),
        previewMode: false,
        currentIndex: -1,
      ),
    );
  }

  double calculateRotate(int index) {
    switch (index) {
      case 0:
        return -0.6;
      case 1:
        return -0.7;
      case 2:
        return -0.5;
      case 3:
        return -0.2;
      case 4:
        return 0;
      case 5:
        return 0;
      case 6:
        return 0.5;
      case 7:
        return 0.7;
      case 8:
        return 0.6;
      default:
        return 0;
    }
  }

  // Future<void> _saveAsImage(GlobalKey key) async {
  //   try {
  //     RenderRepaintBoundary boundary =
  //         key.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //
  //     ui.Image image = await boundary.toImage(pixelRatio: 3.0);
  //
  //     ByteData? byteData = await image.toByteData(
  //       format: ui.ImageByteFormat.png,
  //     );
  //
  //     Uint8List pngBytes = byteData!.buffer.asUint8List();
  //
  //     final directory = await getApplicationDocumentsDirectory();
  //     final filePath = '${directory.path}/bracelet.png';
  //
  //     File imgFile = File(filePath);
  //     await imgFile.writeAsBytes(pngBytes);
  //
  //     log("✅ Image saved at $filePath");
  //   } catch (e) {
  //     log("❌ Error: $e");
  //   }
  // }

  void captureBraceletImage(GlobalKey key) async {
    try {
      await Future.delayed(Duration(milliseconds: 50));

      RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      if (boundary.debugNeedsPaint) {
        await Future.delayed(const Duration(milliseconds: 20));
      }

      ui.Image image = await boundary.toImage(pixelRatio: 3.0);

      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      Uint8List pngBytes = byteData!.buffer.asUint8List();

      customizedImage = pngBytes;

      dev.log("Image captured (${customizedImage!.lengthInBytes} bytes)");
    } catch (e) {
      dev.log("Error capturing image: $e");
    }
  }

  void randomStyle() {
    final random = Random();
    for (int i = 0; i < 9; i++) {
      int randomImageIndex = random.nextInt(letters.length - 1);
      updateAccessory(i, letters[randomImageIndex]);
    }
  }
}
