import 'package:get/get.dart';

import '../screens/ability_details/ability_details_screen.dart';
import '../screens/abilitys/ability_screen.dart';
import '../screens/bottom_tab_bar/bottom_tab_bar.dart';
import '../screens/evolution_details/evolution_details_screen.dart';
import '../screens/language_details/language_details_screen.dart';
import '../screens/pokemon_details/pokemon_details_screen.dart';
import '../screens/pokemon_list/pokemon_list_screen.dart';
import '../screens/type_details/type_details_screen.dart';

class AppRoutes {
  static const bottomTabBar = "/bottomTabBar";
  static const pokemonListScreen = "/pokemonListScreen";
  static const pokemonDetailsScreen = "/pokemonDetailsScreen";
  static const abilityScreen = "/abilityScreen";
  static const abilityDetailsScreen = "/abilityDetailsScreen";
  static const typeDetailsScreen = "/typeDetailsScreen";
  static const languageDetailsScreen = "/languageDetailsScreen";
  static const evolutionDetailsScreen = "/evolutionDetailsScreen";

  static final routes = [
    GetPage(name: bottomTabBar, page: () => BottomTabBar()),
    GetPage(name: pokemonListScreen, page: () => PokemonListScreen()),
    GetPage(name: pokemonDetailsScreen, page: () => PokemonDetailsScreen()),
    GetPage(name: abilityScreen, page: () => AbilityScreen()),
    GetPage(name: abilityDetailsScreen, page: () => AbilityDetailsScreen()),
    GetPage(name: typeDetailsScreen, page: () => TypeDetailsScreen()),
    GetPage(name: languageDetailsScreen, page: () => LanguageDetailsScreen()),
    GetPage(name: evolutionDetailsScreen, page: () => EvolutionDetailsScreen()),
  ];
}
