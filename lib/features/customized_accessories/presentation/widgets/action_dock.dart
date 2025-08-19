import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/customize_accessory_cubit/customize_accessory_cubit.dart';

class ActionDock extends StatelessWidget {
  const ActionDock({super.key, required this.globalKey});

  final GlobalKey globalKey;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeAccessoryCubit>();

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 30.0, left: 16.0, right: 16.0),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30.0, left: 16.0, right: 16.0),
          padding: EdgeInsets.only(top: 10.0),
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFd36d5a).withOpacity(0.3),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => cubit.captureBraceletImage(globalKey),
                child: Column(
                  children: [
                    Icon(Icons.save_rounded, color: Color(0xFFd36d5a)),
                    Text('Save'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => cubit.reset(),
                child: Column(
                  children: [
                    Icon(Icons.refresh_rounded, color: Color(0xFFd36d5a)),
                    Text('Reset'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => cubit.randomStyle(),
                child: Column(
                  children: [
                    Icon(Icons.shuffle_rounded, color: Color(0xFFd36d5a)),
                    Text('Random'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
