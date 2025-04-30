import 'package:get/get.dart';
import 'package:pokemon/data/model/evolution_chain_details_model.dart';
import 'package:pokemon/data/services/api_client.dart';

class EvolutionDetailsController extends GetxController {
  @override
  void onInit() {
    url = Get.arguments;
    fetchEvolutionDetail();
    super.onInit();
  }

  late String url;
  RxBool isLoading = false.obs;

  Rx<EvolutionChainDetail?> evolutionDetailsList =
      Rx<EvolutionChainDetail?>(null);

  void fetchEvolutionDetail() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(url);
      if (response.statusCode == 200) {
        evolutionDetailsList.value =
            EvolutionChainDetail.fromJson(response.data);
      } else {
        print("@@@response.statusCode: ${response.statusCode}");
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
