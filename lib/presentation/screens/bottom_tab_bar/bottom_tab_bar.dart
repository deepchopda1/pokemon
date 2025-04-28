import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/app_strings.dart';
import '../abilitys/ability_screen.dart';
import '../evolution/evolution_chain_screen.dart';
import '../pokemon_list/pokemon_list_screen.dart';

class BottomTabBar extends StatefulWidget {
  const BottomTabBar({super.key});

  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  final RxInt selectTab = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Text(""), label: AppString().pokemon),
            BottomNavigationBarItem(icon: Text(""), label: AppString().ability),
            BottomNavigationBarItem(
                icon: Text(""), label: AppString().evolutionChain),
          ],
          onTap: (value) => selectTab.value = value,
          selectedItemColor: Colors.blue,
          // unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          currentIndex: selectTab.value,
        ),
      ),
      body: Obx(
        () {
          switch (selectTab.value) {
            case 0:
              return PokemonListScreen();
            case 1:
              return AbilityScreen();
            default:
              return EvolutionChainScreen();
          }
        },
      ),
    );
  }
}
