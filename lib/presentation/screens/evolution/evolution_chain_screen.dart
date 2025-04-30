import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/app/app_routes.dart';
import 'package:pokemon/presentation/screens/evolution/controller/evolution_chain_controller.dart';

import '../../../data/model/evolution_chain_model.dart';

class EvolutionChainScreen extends StatefulWidget {
  const EvolutionChainScreen({super.key});

  @override
  State<EvolutionChainScreen> createState() => _EvolutionChainScreenState();
}

class _EvolutionChainScreenState extends State<EvolutionChainScreen> {
  final EvolutionChainController controller =
      Get.put(EvolutionChainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Evolution Chain",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : controller.evolutionChainItem.isEmpty
                ? Text("No evolution chain found",
                    style: TextStyle(fontWeight: FontWeight.bold))
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.evolutionChainItem.length,
                    itemBuilder: (context, index) {
                      final data = controller.evolutionChainItem[index];
                      return ListTile(
                        onTap: () => Get.toNamed(
                            AppRoutes.evolutionDetailsScreen,
                            arguments: data.url),
                        title: Text("${controller.tempList[index]}"),
                        // subtitle: Text(data.url!),
                      );
                    },
                  ),
      ),
    );
  }
}
