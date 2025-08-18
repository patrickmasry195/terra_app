import 'package:flutter/material.dart';

class ShopHere extends StatelessWidget {
  const ShopHere({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color(0xFFD36C5B),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Image.network(
            'https://images.unsplash.com/photo-1631965004544-1762fc696476?q=80&w=735&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            'Bubbly Initials!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            'Stainless steel - Rust free',
            style: TextStyle(color: Colors.white70, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text(
              'Shop here',
              style: TextStyle(color: Color(0xFFD36C5B)),
            ),
          ),
        ],
      ),
    );
  }
}
