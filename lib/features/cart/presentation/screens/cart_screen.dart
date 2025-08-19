import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/cart_cubit.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color(0xFFD36C5B)),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Color(0xFFD36C5B),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFFFADCD6),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          final cartItems = state.items;
          if (cartItems.isEmpty) {
            return Center(
              child: Text(
                "Empty Cart List",
                style: TextStyle(color: Color(0xFFD36C5B)),
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(16),

                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    return CartItemTile(cartItem: cartItems[index]);
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Procceed To CheckOut"),
              ),
            ],
          );
        },
      ),
    );
  }
}
