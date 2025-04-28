import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            : controller.evolutionChainList.value == null
                ? Text("No evolution chain found",
                    style: TextStyle(fontWeight: FontWeight.bold))
                : SingleChildScrollView(
                    child: buildEvolutionChain(
                        controller.evolutionChainList.value!.chain),
                  ),
      ),
    );
  }

  Widget buildEvolutionChain(ChainLink node) {
    return Column(
      children: [
        buildPokemonCard(node.species.name),
        if (node.evolvesTo.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Icon(Icons.arrow_downward, size: 32),
          const SizedBox(height: 8),
          ...node.evolvesTo.map(buildEvolutionChain).toList(),
        ]
      ],
    );
  }

  Widget buildPokemonCard(String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Image.network(
          "https://img.pokemondb.net/sprites/home/normal/$name.png",
          height: 60,
          width: 60,
          errorBuilder: (_, __, ___) =>
              const Icon(Icons.catching_pokemon, size: 50),
        ),
        title: Text(
          capitalize(name),
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  String capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}
