import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/customize_accessory_cubit/customize_accessory_cubit.dart';
import 'add_button.dart';

class AddButtonsList extends StatelessWidget {
  const AddButtonsList({
    super.key,
    required this.slots,
    required this.centerX,
    required this.radius,
    required this.centerY,
  });

  final int slots;
  final double centerX;
  final double radius;
  final double centerY;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeAccessoryCubit>();

    return Stack(
      children: List.generate(9, (i) {
        double angle = pi + (pi * i / (slots - 1));

        double x = centerX + radius * cos(angle + 600);
        double y = centerY + radius * sin(angle + 600);

        return Positioned(
          left: x - 20,
          top: y - 20,
          child: BlocBuilder<CustomizeAccessoryCubit, CustomizeAccessoryState>(
            builder: (context, state) {
              if (i < state.accessories.length &&
                  state.accessories[i].isNotEmpty) {
                return GestureDetector(
                  onTap: () => cubit.selectedButton(i),
                  child: Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: state.previewMode
                        ? null
                        : state.currentIndex == i
                        ? BoxDecoration(
                            color: Color(0xFFd36d5a).withOpacity(0.3),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Color(0xFFd36d5a),
                              width: 2,
                            ),
                          )
                        : null,
                    child: Transform.rotate(
                      angle: cubit.calculateRotate(i),
                      child: Image.asset(state.accessories[i]),
                    ),
                  ),
                );
              } else {
                return Visibility(
                  visible: !state.previewMode,
                  child: AddButton(
                    isSelected: state.currentIndex == i,
                    onTap: () => cubit.selectedButton(i),
                  ),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
