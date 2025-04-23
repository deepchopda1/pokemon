import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/pokemon_details_controller.dart';

class PokemonDetailsScreen extends StatefulWidget {
  const PokemonDetailsScreen({super.key});

  @override
  State<PokemonDetailsScreen> createState() => _PokemonDetailsScreenState();
}

class _PokemonDetailsScreenState extends State<PokemonDetailsScreen> {
  final PokemonDetailsController controller =
      Get.put(PokemonDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Obx(
      //     () => Text(
      //       controller.isLoading.value
      //           ? ""
      //           : controller.details.value!.name.toString(),
      //       style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
      //     ),
      //   ),
      // ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Text("${controller.details.value?.name}"),
                  Stack(
                    children: [],
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.red,
                    child: Image.network(
                      "${controller.details.value!.sprites!.frontDefault}",
                      height: 200,
                      width: 200,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
