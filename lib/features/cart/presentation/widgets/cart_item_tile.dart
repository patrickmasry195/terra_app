import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/cart_item.dart';
import '../cubits/cart_cubit.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 2,
          color: Colors.black
        ),
        borderRadius: BorderRadiusGeometry.circular(14)
      ),
      leading: SizedBox(
        height: 100,
        width: 100,
        child: Image.asset(
          cartItem.accessory.imageURL,
          fit: BoxFit.contain,
        ),
      ),
      title: Row(
        children: [
          Text(cartItem.accessory.title),
          Spacer(),
          IconButton(
            onPressed:(){
              context.read<CartCubit>().removeFromCart(cartItem.accessory);
            }, 
            icon: Icon(Icons.delete)
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cartItem.accessory.description,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              IconButton(
                onPressed:(){
                      
                }, 
                icon: Icon(Icons.abc)
              ),
              Spacer(),
              Text(
                cartItem.accessory.price.toStringAsFixed(2)
              )
            ],
          )
        ],
      ),
    );
  }
}