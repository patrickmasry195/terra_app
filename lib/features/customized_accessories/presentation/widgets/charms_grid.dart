import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/customize_accessory_cubit/customize_accessory_cubit.dart';

class CharmsGrid extends StatelessWidget {
  const CharmsGrid({
    super.key,
    required this.state,
  });

  final CustomizeAccessoryState state;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeAccessoryCubit>();

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cubit.letters.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            cubit.updateAccessory(
              state.currentIndex,
              cubit.letters[index],
            );
          },
          child: Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(
                10.0,
              ),
            ),
            child: Image.asset(
              cubit.letters[index],
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
