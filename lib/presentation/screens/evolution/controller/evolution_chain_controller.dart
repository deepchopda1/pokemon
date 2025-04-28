import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/model/evolution_chain_model.dart';
import 'package:pokemon/data/services/api_client.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

class EvolutionChainController extends GetxController {
  @override
  void onInit() {
    fetchEvolutionChain();
    super.onInit();
  }

  final RxBool isLoading = false.obs;
  final Rx<EvolutionChain?> evolutionChainList = Rx<EvolutionChain?>(null);

  void fetchEvolutionChain() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(ApiEndpointUrl.evolutionChain);
      if (response.statusCode == 200) {
        evolutionChainList.value = EvolutionChain.fromJson(response.data);
      } else {
        print("@@@StatusCode: ${response.statusCode}");
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
