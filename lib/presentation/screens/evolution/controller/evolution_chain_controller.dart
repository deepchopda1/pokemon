import 'package:get/get.dart';
import 'package:pokemon/data/model/evolution_chain_model.dart';
import 'package:pokemon/data/services/api_client.dart';
import 'package:pokemon/data/services/api_endpoint_url.dart';

import '../../../../data/model/evolution_chain_details_model.dart';

class EvolutionChainController extends GetxController {
  @override
  void onInit() {
    fetchEvolutionChain();
    super.onInit();
  }

  RxList<Result> evolutionChainItem = <Result>[].obs;
  Rx<EvolutionChainDetail?> evolutionChainDetails =
      Rx<EvolutionChainDetail?>(null);

  RxList tempList = [].obs;
  var isLoading = false.obs;

  void fetchEvolutionChain() async {
    isLoading.value = true;
    try {
      final response = await ApiClient().get(ApiEndpointUrl.evolutionChainItem);
      if (response.statusCode == 200) {
        evolutionChainItem.value =
            EvolutionChainItem.fromJson(response.data).results!;

        for (var item in evolutionChainItem) {
          final url = item.url;
          final response = await ApiClient().get(url!);
          final data = EvolutionChainDetail.fromJson(response.data);
          tempList.add(data.chain!.species!.name);
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
