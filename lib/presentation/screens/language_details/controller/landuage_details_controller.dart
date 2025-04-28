import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';

import '../../../../data/model/language_details_model.dart';

class LanguageDetailsController extends GetxController {
  @override
  void onInit() {
    url = Get.arguments;
    fetchLanguageDetail();
    super.onInit();
  }

  late String url;
  RxBool isLoading = false.obs;
  Rx<LanguageDetail?> languageDetailsList = Rx<LanguageDetail?>(null);

  void fetchLanguageDetail() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        languageDetailsList.value = LanguageDetail.fromJson(response.data);
        print("@@@${languageDetailsList.value}");
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
