import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pokemon/presentation/screens/pokemon_list/pokemon_list_screen.dart';

class AppRoutes {
  static const pokemonListScreen = "/pokemonListScreen";

  static final routes = [
    GetPage(name: pokemonListScreen, page: () => PokemonListScreen())
  ];
}
