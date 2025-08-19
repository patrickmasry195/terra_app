import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../manager/customize_accessory_cubit/customize_accessory_cubit.dart';

class PreviewButton extends StatelessWidget {
  const PreviewButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeAccessoryCubit>();
    return SafeArea(
      child: GestureDetector(
        onTap: () => cubit.togglePreview(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Card(
                color: Color(0xFFd36d5a).withOpacity(0.3),
                elevation: 0.0,
                child: IconButton(
                  onPressed: () => GoRouter.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color(0xFFd36d5a),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Card(
                color: Color(0xFFd36d5a).withOpacity(0.3),
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:
                      BlocBuilder<
                        CustomizeAccessoryCubit,
                        CustomizeAccessoryState
                      >(
                        builder: (context, state) {
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                state.previewMode
                                    ? Icons.visibility_off_sharp
                                    : Icons.visibility,
                                color: Color(0xFFd36d5a),
                              ),
                              SizedBox(width: 5.0),
                              Text(
                                state.previewMode ? 'Preview' : 'Edit',
                                style: TextStyle(
                                  color: Color(0xFFd36d5a),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
