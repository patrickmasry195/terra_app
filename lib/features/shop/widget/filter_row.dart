import 'package:flutter/material.dart';
import '../cubit/shop_cubit.dart';
import 'drop_down_widget.dart';

class FilterRow extends StatelessWidget {
  final ShopCubit cubit;

  const FilterRow({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("assets/images/filter.png", height: 20),
        const SizedBox(width: 8),
        const Text("Filter", style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        Expanded(
          child: DropdownWidget(
            title: "Available",
            items: cubit.availabilityList,
            openDropdown: cubit.openDropdown,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: DropdownWidget(
            title: "Price",
            items: cubit.priceList,
            openDropdown: cubit.openDropdown,
          ),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: DropdownWidget(
            title: "Sort by",
            items: cubit.sortByList,
            openDropdown: cubit.openDropdown,
          ),
        ),
      ],
    );
  }
}

