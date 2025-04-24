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

  late Result url;
  PageController pageController = PageController();
  // RxInt imageIndex = 0.obs;
  RxBool isLoading = false.obs;
  Rx<PokemonDetails?> details = Rx<PokemonDetails?>(null);
  RxList imagesList = [].obs;

  void nextImage() {
    pageController.animateToPage(
      pageController.page!.toInt() + 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousImage() {
    pageController.animateToPage(
      pageController.page!.toInt() - 1,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void addImageIntoList(String? url) {
    if (url != null) imagesList.add(url);
  }

  void fetchPokemonDetails() async {
    try {
      isLoading.value = true;
      final response = await ApiClient().get("${url.url}");
      if (response.statusCode == 200) {
        details.value = PokemonDetails.fromJson(response.data);
        print("@@@details.value: ${details.value}");
        final other = details.value!.sprites!.other;

        // addImageIntoList(other?.dreamWorld?.frontDefault);
        addImageIntoList(other?.dreamWorld?.frontFemale);
        addImageIntoList(other?.home?.frontDefault);
        addImageIntoList(other?.home?.frontFemale);
        addImageIntoList(other?.home?.frontShiny);
        addImageIntoList(other?.home?.frontShinyFemale);
        addImageIntoList(other?.officialArtwork?.frontDefault);
        addImageIntoList(other?.officialArtwork?.frontShiny);
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
