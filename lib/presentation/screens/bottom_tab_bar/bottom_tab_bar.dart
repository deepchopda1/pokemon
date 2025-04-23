import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pokemon_list/pokemon_list_screen.dart';
import '../pokemon_moves/pokemon_moves_screen.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  RxInt selectTab = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Text(""), label: "Pokemon"),
          BottomNavigationBarItem(icon: Text(""), label: "Move"),
        ],
        onTap: (value) => selectTab.value = value,
      ),
      body: Obx(
        () {
          switch (selectTab.value) {
            case 0:
              return PokemonListScreen();
            default:
              return PokemonMovesScreen();
          }
        },
      ),
    );
  }
}
