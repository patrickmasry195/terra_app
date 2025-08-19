import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';
import 'package:terra_app/features/customized_accessories/presentation/manager/customize_accessory_cubit/customize_accessory_cubit.dart';

class BraceletCarouselScreen extends StatefulWidget {
  const BraceletCarouselScreen({super.key});

  @override
  State<BraceletCarouselScreen> createState() => _BraceletCarouselScreenState();
}

class _BraceletCarouselScreenState extends State<BraceletCarouselScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.7);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CustomizeAccessoryCubit>();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          "Choose Bracelet",
          style: TextStyle(color: Color(0xffd36d5a)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFFADCD6),
        elevation: 0,
        foregroundColor: Color(0xffd36d5a),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child:
                  BlocBuilder<CustomizeAccessoryCubit, CustomizeAccessoryState>(
                    builder: (context, state) {
                      return PageView.builder(
                        controller: _pageController,
                        itemCount: cubit.bracelets.length,
                        onPageChanged: (index) =>
                            cubit.updateBraceletCurrentIndex(index),
                        itemBuilder: (context, index) {
                          final bracelet = cubit.bracelets[index];
                          final isActive =
                              index == state.braceletCarouselCurrentIndex;

                          return AnimatedBuilder(
                            animation: _pageController,
                            builder: (context, child) {
                              double value = 1.0;
                              if (_pageController.position.haveDimensions) {
                                value = (_pageController.page! - index).abs();
                                value = (1 - (value * 0.3)).clamp(0.8, 1.0);
                              }
                              return Center(
                                child: Transform.scale(
                                  scale: value,
                                  child: AnimatedOpacity(
                                    duration: const Duration(milliseconds: 300),
                                    opacity: isActive ? 1.0 : 0.6,
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 20,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: isActive
                                            ? [
                                                BoxShadow(
                                                  color: Color(
                                                    0xFFd36d5a,
                                                  ).withOpacity(0.4),
                                                  blurRadius: 20,
                                                  spreadRadius: 2,
                                                ),
                                              ]
                                            : [
                                                BoxShadow(
                                                  color: Colors.black12,
                                                  blurRadius: 10,
                                                ),
                                              ],
                                      ),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0),
                                              ),
                                              child: Image.asset(
                                                bracelet["image"]!,
                                                fit: BoxFit.fill,
                                                width: double.infinity,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                          Text(
                                            bracelet["name"]!,
                                            style: TextStyle(
                                              fontSize: isActive ? 20 : 16,
                                              fontWeight: isActive
                                                  ? FontWeight.bold
                                                  : FontWeight.w400,
                                              color: isActive
                                                  ? Colors.black87
                                                  : Colors.grey,
                                            ),
                                          ),
                                          const SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
            ),
            ElevatedButton(
              onPressed: () {
                cubit.submitBracelet();
                GoRouter.of(context).push(AppRouter.kCustomizeAccessory);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                backgroundColor: Color(0xFFd36d5a),

                elevation: 3,
              ),
              child: const Text(
                "Customize",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
