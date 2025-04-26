import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/data/services/api_client.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

import '../../../../data/model/ability_model.dart';

class AbilityController extends GetxController {
  @override
  void onInit() {
    fetchAbility();
    super.onInit();
  }

  RxBool isLoading = false.obs;

  RxList<Result> abilityList = <Result>[].obs;
  String? nextUrl;
  String? previousUrl;

  void fetchAbility({bool isNextPage = false}) async {
    isLoading.value = true;
    try {
      final url =
          isNextPage && nextUrl != null ? nextUrl! : ApiEndpointUrl.ability;

      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        final data = AbilityList.fromJson(response.data);

        nextUrl = data.next;
        previousUrl = data.previous;

        if (isNextPage) {
          abilityList.addAll(data.results!);
        } else {
          abilityList.value = data.results!;
        }
        // isNextPage
        //     ? abilityList.addAll(data.results!)
        //     : abilityList.value = data.results!;

        print("@@@abilityList.length: ${abilityList.length}");
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
