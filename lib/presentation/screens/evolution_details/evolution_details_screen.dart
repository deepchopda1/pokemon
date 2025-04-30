import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/screens/evolution_details/controller/evolution_details_controller.dart';

import '../../../data/model/evolution_chain_details_model.dart';

class EvolutionDetailsScreen extends StatefulWidget {
  const EvolutionDetailsScreen({super.key});

  @override
  State<EvolutionDetailsScreen> createState() => _EvolutionDetailsScreenState();
}

class _EvolutionDetailsScreenState extends State<EvolutionDetailsScreen> {
  final EvolutionDetailsController controller =
      Get.put(EvolutionDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        final evolution = controller.evolutionDetailsList.value!;
        return Scaffold(
          appBar: AppBar(
            title: Text("${evolution.chain!.species!.name!.capitalize}"),
          ),
          body: controller.evolutionDetailsList.value == null
              ? Center(
                  child: Text("No data found"),
                )
              : SingleChildScrollView(
                  child: buildEvolutionChain(
                      controller.evolutionDetailsList.value!.chain),
                ),
        );
      },
    );
  }

  Widget buildEvolutionChain(Chain? node) {
    return Column(
      children: [
        buildPokemonCard(node!.species!.name),
        if (node.evolvesTo!.isNotEmpty) ...[
          SizedBox(height: 08),
          Icon(Icons.arrow_downward, size: 32),
          SizedBox(height: 08),
          ...node.evolvesTo!.map(buildEvolutionChain),
        ]
      ],
    );
  }

  Widget buildPokemonCard(String? name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://img.pokemondb.net/sprites/home/normal/$name.png",
          height: 60,
          width: 60,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) => Icon(
            Icons.catching_pokemon,
            size: 50,
          ),
        ),
        SizedBox(width: 10),
        Text(
          name!,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
