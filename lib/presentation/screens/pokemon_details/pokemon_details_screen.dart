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
      appBar: AppBar(
        centerTitle: true,
        title: Obx(
          () => Text(
            controller.isLoading.value
                ? ""
                : "${controller.details.value!.name} #${controller.details.value!.id}",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          PageView.builder(
                            controller: controller.pageController,
                            itemCount: controller.imagesList.length,
                            onPageChanged: (value) {},
                            itemBuilder: (context, index) {
                              return Image.network(
                                  controller.imagesList[index]);
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    onPressed: () => controller.previousImage(),
                                    icon: Icon(
                                      Icons.arrow_left_rounded,
                                      size: 35,
                                    ),
                                    style: IconButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    onPressed: () => controller.nextImage(),
                                    icon: Icon(
                                      Icons.arrow_left_rounded,
                                      size: 35,
                                    ),
                                    style: IconButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Type",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 05),
                          Wrap(
                            spacing: 08,
                            children: controller.details.value!.types!
                                .map((type) => Chip(
                                    label: Text(type.type!.name.toString())))
                                .toList(),
                          ),
                          // SizedBox(height: 15),
                          // Align(
                          //   alignment: Alignment.centerLeft,
                          //   child: const Text("Moves",
                          //       style: TextStyle(
                          //           fontSize: 18, fontWeight: FontWeight.bold)),
                          // ),
                          // const SizedBox(height: 8),
                          // ...controller.details.value!.moves!.map(
                          //   (move) => ListTile(
                          //     contentPadding: EdgeInsets.zero,
                          //     leading: const Icon(Icons.sports_martial_arts),
                          //     title: Text("${move.move!.name}"),
                          //   ),
                          // ),
                          SizedBox(height: 15),
                          Text(
                            "Abilities",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          ...controller.details.value!.abilities!
                              .map((ability) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    leading: Icon(Icons.bolt),
                                    title:
                                        Text(ability.ability!.name.toString()),
                                  )),
                          SizedBox(height: 15),
                          Text(
                            "Stats",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SizedBox(height: 05),
                          ...controller.details.value!.stats!.map((stat) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                        width: 100,
                                        child:
                                            Text(stat.stat!.name.toString())),
                                    Expanded(
                                      child: LinearProgressIndicator(
                                        value: stat.baseStat! / 100,
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            );
                          }),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  const Text("Height",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 05),
                                  Text(
                                      "${controller.details.value!.height! / 10} m"),
                                ],
                              ),
                              Column(
                                children: [
                                  const Text("Weight",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 05),
                                  Text(
                                      "${controller.details.value!.weight! / 10} kg"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
