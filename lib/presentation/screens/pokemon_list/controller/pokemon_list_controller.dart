import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

import '../../../../data/model/pokemon_list_model.dart';

class PokemonListController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPokemonList();
  }

  RxBool isLoading = false.obs;
  Rx<PokemonList?> pokemonList = Rx<PokemonList?>(null);
  // Rx<PokemonList?> allPokemon = Rx<PokemonList?>(null);
  RxList<Result> allPokemon = <Result>[].obs;
  String? nextUrl;
  String? previousUrl;

  void fetchPokemonList({bool isNextPage = false}) async {
    try {
      isLoading.value = true;

      final url =
          isNextPage && nextUrl != null ? nextUrl! : ApiEndpointUrl.pokemonList;

      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        pokemonList.value = PokemonList.fromJson(response.data);

        nextUrl = pokemonList.value!.next;
        previousUrl = pokemonList.value!.previous;

        if (isNextPage) {
          allPokemon.addAll(pokemonList.value!.results!);
        } else {
          allPokemon.value = pokemonList.value!.results!;
        }
      } else {
        print("@@@Status Code: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "${e}",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
