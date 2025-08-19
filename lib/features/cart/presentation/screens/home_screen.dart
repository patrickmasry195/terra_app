import 'package:flutter/material.dart';
import 'package:terra_app/core/dummy_data/accessories.dart';
import 'package:terra_app/features/cart/presentation/screens/cart_screen.dart';

import '../widgets/accessory_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: (){
             Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => CartScreen())
             );
            }, 
            icon: Icon(Icons.shopping_bag)
          )
        ],
      ),
      body: GridView.builder(
        itemCount:accessories.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15 ,
          childAspectRatio: 0.75
        ),
        itemBuilder: (context , index){
          return AccessoryCard(accessory: accessories[index]);
        }
      )
    );
  }
}