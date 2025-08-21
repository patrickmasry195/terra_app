import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/shop_cubit.dart';
import '../widget/filter_row.dart';
import '../widget/pagination.dart';
import '../widget/product_grid_view.dart';

class ShopScreen extends StatelessWidget {
  final String category;

  const ShopScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShopCubit(),
      child: BlocBuilder<ShopCubit, ShopState>(
        builder: (context, state) {
          final cubit = context.read<ShopCubit>();
          final currentItems = cubit.getCurrentItems();

          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    FilterRow(cubit: cubit),
                    const SizedBox(height: 20),
                    productGridView(currentItems: currentItems,),
                    const SizedBox(height: 20),
                    Pagination(
                      totalPages: cubit.totalPages,
                      currentPage: cubit.currentPage,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

