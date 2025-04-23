import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';

import '../../../../data/model/pokemon_details_model.dart';
import '../../../../data/model/pokemon_list_model.dart';

class PokemonDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    url = Get.arguments;
    fetchPokemonDetails();
    super.onInit();
  }

  RxBool isLoading = false.obs;
  late Result url;
  Rx<PokemonDetails?> details = Rx<PokemonDetails?>(null);

  void fetchPokemonDetails() async {
    try {
      isLoading.value = true;
      final response = await ApiClient().get("${url.url}");
      if (response.statusCode == 200) {
        details.value = PokemonDetails.fromJson(response.data);
        print("@@@details.value: ${details.value}");
      } else {
        print("@@@Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("@@@Error: ${e}");
      Get.snackbar(
        "Error",
        "$e",
        backgroundColor: Colors.red,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
