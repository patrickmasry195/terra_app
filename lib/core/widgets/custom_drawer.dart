import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  CustomDrawerState createState() => CustomDrawerState();
}

class CustomDrawerState extends State<CustomDrawer> {
  String _currentPage = 'home';

  final List<String> shopCategories = [
    'Bag charms',
    'Hand chains',
    'Necklaces',
    'Bracelets',
    'Earrings',
    'Rings',
    'Anklets',
    'Hair accessories',
    'Waist chains',
    'Foot chains',
    'Phone straps',
  ];

  final List<String> customizeCategories = const [
    'Charms necklace',
    'Charms bracelet',
    'Key chains',
    'Bag charms 1',
    'Bag charms 2',
    'Charms',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xFFFADCD6),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              if (_currentPage != 'home')
                ListTile(
                  leading: const Icon(
                    Icons.arrow_back,
                    color: Color(0xFFD36C5B),
                  ),
                  title: Text(
                    _currentPage == 'shop' ? 'shop' : 'Customize it',
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  onTap: () {
                    setState(() {
                      _currentPage = 'home';
                    });
                  },
                ),

              if (_currentPage == 'home') _buildHomeList(),

              if (_currentPage == 'shop') _buildShopList(),

              if (_currentPage == 'customize') _buildCustomizeList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHomeList() {
    return Expanded(
      child: Column(
        children: [
          ListTile(
            title: const Text(
              'Home',
              style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
            ),
            onTap: () {
              GoRouter.of(context).go(AppRouter.kHomePage);
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text(
              'Shop',
              style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFD36C5B),
            ),
            onTap: () {
              setState(() {
                _currentPage = 'shop';
              });
            },
          ),
          ListTile(
            title: const Text(
              'Customize it',
              style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: Color(0xFFD36C5B),
            ),
            onTap: () {
              setState(() {
                _currentPage = 'customize';
              });
            },
          ),
          const Spacer(),
          ListTile(
            leading: const Icon(
              Icons.person_2_outlined,
              color: Color(0xFFD36C5B),
            ),
            title: const Text(
              'Log in',
              style: TextStyle(fontSize: 16, color: Color(0xFFD36C5B)),
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kUserProfile);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildShopList() {
    return Expanded(
      child: ListView.builder(
        itemCount: shopCategories.length,
        itemBuilder: (context, index) {
          final category = shopCategories[index];
          return ListTile(
            title: Text(
              category,
              style: const TextStyle(color: Color(0xFFD36C5B), fontSize: 16),
            ),
            onTap: () {
              final encoded = Uri.encodeComponent(category); // safe for spaces
              GoRouter.of(context).push('/shop_page/$encoded');
              Navigator.pop(context); // close drawer
            },
          );
        },
      ),
    );
  }

  Widget _buildCustomizeList() {
    return Expanded(
      child: ListView.builder(
        itemCount: customizeCategories.length,
        itemBuilder: (context, index) {
          final category = customizeCategories[index];
          return ListTile(
            title: Text(
              category,
              style: const TextStyle(color: Color(0xFFD36C5B), fontSize: 16),
            ),
            onTap: () {
              GoRouter.of(context).push(AppRouter.kBraceletCarousel);
              Navigator.pop(context);
            },
          );
        },
      ),
    );
  }
}
