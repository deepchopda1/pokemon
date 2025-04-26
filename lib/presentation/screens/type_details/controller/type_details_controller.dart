import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';

import '../../../../data/model/type_details_model.dart';

class TypeDetailsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    url = Get.arguments;
    fetchTypeDetails();
  }

  late String url;
  RxBool isLoading = false.obs;
  Rx<TypeDetail?> typeList = Rx<TypeDetail?>(null);

  void fetchTypeDetails() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        typeList.value = TypeDetail.fromJson(response.data);
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
