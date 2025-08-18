import 'package:flutter/material.dart';
import 'package:terra_app/core/widgets/custom_card_item.dart';
import 'package:terra_app/features/product_details/presentation/widgets/counter_box.dart';
import 'package:terra_app/features/product_details/presentation/widgets/custom_button.dart';
import 'package:terra_app/features/product_details/presentation/widgets/custom_slider.dart';
import 'package:terra_app/features/product_details/presentation/widgets/expanded_info_tile.dart';

class ProductDetailsPageBody extends StatefulWidget {
  const ProductDetailsPageBody({super.key});

  @override
  State<ProductDetailsPageBody> createState() => _ProductDetailsPageBodyState();
}

class _ProductDetailsPageBodyState extends State<ProductDetailsPageBody> {
  int currentPage = 0;
  int count = 1;
  bool isExpanded = false;

  final PageController _pageController = PageController();
  final List<String> images = [
    "assets/images/test.png",
    "assets/images/test2.png",
  ];

  void nextPage() {
    if (currentPage < images.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void prevPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void increment() => setState(() => count++);
  void decrement() => setState(() {
    if (count > 1) count--;
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 400,
                    width: 500,
                    decoration: const BoxDecoration(color: Color(0xffededed)),
                    child: Stack(
                      children: [
                        PageView.builder(
                          controller: _pageController,
                          itemCount: images.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return Center(
                              child: Image.asset(images[index], height: 350),
                            );
                          },
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.zoom_in),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // 🔹 Custom Slider for navigation
                  CustomSlider(
                    currentPage: currentPage + 1,
                    totalPages: images.length,
                    onNext: nextPage,
                    onPrev: prevPage,
                  ),

                  const SizedBox(height: 10),
                  const Text("Terra"),
                  const Text(
                    "Red stone drop necklace",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  const Text("LE 450.00 EGP", style: TextStyle(fontSize: 14)),
                  const Text("Tax included.", style: TextStyle(fontSize: 10)),
                  const SizedBox(height: 20),
                  const Text("Quantity", style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 8),
                  CounterBox(
                    value: count,
                    onIncrement: increment,
                    onDecrement: decrement,
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    text: "Add to cart",
                    onPressed: () {},
                    color: Colors.white,
                    hasBorder: true,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  CustomButton(
                    text: "Buy it now",
                    onPressed: () {},
                    color: const Color(0xffd16147),
                    hasBorder: false,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "18K Gold plated (Keep it away from water, perfume, moisture)",
                    style: TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 15),
                  Divider(color: Colors.grey.shade400),
                  const SizedBox(height: 2),
                  ExpandableInfoTile(
                    icon: Icons.local_shipping_outlined,
                    title: "Shipping & Returns",
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    content:
                        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                    isExpanded: isExpanded,
                  ),
                  Divider(color: Colors.grey.shade400),
                  const SizedBox(height: 2),
                  ExpandableInfoTile(
                    icon: Icons.favorite_outline,
                    title: "Care Instructions",
                    content:
                        'Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum',
                    isExpanded: isExpanded,
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                  ),
                  Divider(color: Colors.grey.shade400),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.black),
                    label: const Text(
                      "Share",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    "You may also like",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  GridView.count(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 3,
                            horizontal: 3,
                          ),
                          child: CustomCardItem(
                            title: "Green stones drop necklace",
                            imageUrl: 'assets/images/test3.png',
                            price: 'LE 200.25 EGP',
                          ),
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
