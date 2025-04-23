import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

import '../../../../data/model/pokemon_list_model.dart';

class PokemonListController extends GetxController {
  RxBool isLoading = false.obs;

  Rx<Result?> allPokemons = Rx<Result?>(null);
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
        final data = PokemonList.fromJson(response.data);

        nextUrl = data.next;
        previousUrl = data.previous;

        if (isNextPage) {
          allPokemon.addAll(data.results!);
        } else {
          allPokemon.value = data.results!;
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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchPokemonList();
  }
}
