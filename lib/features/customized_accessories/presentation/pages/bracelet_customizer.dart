import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:terra_app/features/customized_accessories/presentation/manager/customize_accessory_cubit/customize_accessory_cubit.dart';
import '../widgets/action_dock.dart';
import '../widgets/add_buttons_list.dart';
import '../widgets/charms_grid.dart';
import '../widgets/preview_button.dart';

class BraceletCustomizer extends StatelessWidget {
  const BraceletCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();

    final cubit = context.read<CustomizeAccessoryCubit>();

    return SafeArea(
      child: Scaffold(
        bottomSheet: ActionDock(globalKey: key),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (scaffoldContext) {
            return BlocBuilder<
              CustomizeAccessoryCubit,
              CustomizeAccessoryState
            >(
              builder: (context, state) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    double height = 550.0;
                    int slots = 9;
                    double radius =
                        width / (state.accessories.isNotEmpty ? 2.9 : 2.5);
                    double centerX = width / 2;
                    double centerY = height * 0.6;
                    return Column(
                      children: [
                        RepaintBoundary(
                          key: key,
                          child: SizedBox(
                            width: width,
                            height: height,
                            child: Stack(
                              children: [
                                Positioned.fill(
                                  child: Image.asset(
                                    cubit.selectedBracelet!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                PreviewButton(),
                                AddButtonsList(
                                  slots: slots,
                                  centerX: centerX,
                                  radius: radius,
                                  centerY: centerY,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Stack(
                              children: [
                                CustomScrollView(
                                  slivers: [
                                    SliverToBoxAdapter(
                                      child: SizedBox(height: 20.0),
                                    ),
                                    SliverList.builder(
                                      itemCount: cubit.titles.length,
                                      itemBuilder: (context, listIndex) =>
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  cubit.titles[listIndex],
                                                ),
                                              ),
                                              CharmsGrid(state: state),
                                            ],
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
