import 'package:flutter/material.dart';
import 'package:untitled/src/features/items/presentation/pages/item_details_screen.dart';
import 'package:untitled/src/features/items/presentation/pages/items_list_screen.dart';

class RouteGenerator {
  static Route onGenerate(RouteSettings settings) {
    late Widget page;
    page = switch (settings.name) {
      ItemDetailScreen.name => ItemDetailScreen(
          itemId: settings.arguments as int,
        ),
      _ => ItemsListScreen(),
    };

    return MaterialPageRoute(builder: (_) => page);
  }
}
