import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:terra_app/core/utils/app_router.dart';

class TerraNormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearchTap;

  const TerraNormalAppBar({super.key, required this.onSearchTap});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFD36C5B)),
      backgroundColor: const Color(0xFFFADCD6),
      elevation: 0,
      title: const Text(
        'TERRA',
        style: TextStyle(
          color: Color(0xFFD36C5B),
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.search), onPressed: onSearchTap),
        IconButton(
          icon: const Icon(Icons.shopping_bag_outlined),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kCartPage);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

/// Search app bar with text field
class TerraSearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;
  final VoidCallback onClose;

  const TerraSearchAppBar({
    super.key,
    required this.searchController,
    required this.onChanged,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFD36C5B)),
      backgroundColor: const Color(0xFFFADCD6),
      elevation: 0,
      title: SizedBox(
        height: 45,
        child: TextField(
          cursorColor: const Color(0xFFD36C5B),
          controller: searchController,
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search, color: Color(0xFFD36C5B)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: const BorderSide(color: Colors.white),
            ),
            labelText: 'Search',
            labelStyle: const TextStyle(color: Color(0xFFD36C5B), fontSize: 12),
          ),
          onChanged: onChanged,
        ),
      ),
      actions: [IconButton(icon: const Icon(Icons.close), onPressed: onClose)],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
