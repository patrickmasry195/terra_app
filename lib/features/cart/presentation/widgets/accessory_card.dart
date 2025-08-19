import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/dummy_data/accessory.dart';

import '../cubits/cart_cubit.dart';

class AccessoryCard extends StatelessWidget{
  const AccessoryCard({
    required this.accessory,
    super.key
  });


  final Accessory accessory;


  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 100,
            width:100,
            child: Image.asset(
              accessory.imageURL,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(accessory.title),
                const SizedBox(height: 12,),
                Text(
                  accessory.description,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12,),
                Row(
                  children: [
                    Text(accessory.price.toStringAsFixed(2)),
                    Spacer(),
                    TextButton(
                      onPressed: (){
                        context.read<CartCubit>().addToCart(
                          accessory
                        );
                      },
                      child: Text("add to cart")
                    )
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}