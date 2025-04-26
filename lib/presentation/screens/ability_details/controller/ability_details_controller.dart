import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';

import '../../../../data/model/ability_details_model.dart';

class AbilityDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    url = Get.arguments;
    fetchAbilityDetails();
  }

  late String url;
  RxBool isLoading = false.obs;
  Rx<AbilityDetail?> abilityDetails = Rx<AbilityDetail?>(null);

  void fetchAbilityDetails() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        abilityDetails.value = AbilityDetail.fromJson(response.data);
        print("@@@${abilityDetails.value!.id}");
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
