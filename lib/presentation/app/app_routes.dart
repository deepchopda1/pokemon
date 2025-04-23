import 'package:get/get.dart';

import '../screens/bottom_tab_bar/bottom_tab_bar.dart';
import '../screens/pokemon_details/pokemon_details_screen.dart';
import '../screens/pokemon_list/pokemon_list_screen.dart';

class AppRoutes {
  static const bottomTabBar = "/bottomTabBar";
  static const pokemonListScreen = "/pokemonListScreen";
  static const pokemonDetailsScreen = "/pokemonDetailsScreen";

  static final routes = [
    GetPage(name: bottomTabBar, page: () => BottomTabBar()),
    GetPage(name: pokemonListScreen, page: () => PokemonListScreen()),
    GetPage(name: pokemonDetailsScreen, page: () => PokemonDetailsScreen()),
  ];
}
