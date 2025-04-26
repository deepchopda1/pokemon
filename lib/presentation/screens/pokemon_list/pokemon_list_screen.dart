import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/app/app_routes.dart';

import 'controller/pokemon_list_controller.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  State<PokemonListScreen> createState() => _PokemonListScreenState();
}

class _PokemonListScreenState extends State<PokemonListScreen> {
  final PokemonListController controller = Get.put(PokemonListController());
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 200 &&
          !controller.isLoading.value &&
          controller.nextUrl != null) {
        controller.fetchPokemonList(isNextPage: true);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pokemon",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Obx(
        () => controller.allPokemon.isEmpty && controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                controller: scrollController,
                shrinkWrap: true,
                itemCount: controller.allPokemon.length + 1,
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  if (index == controller.allPokemon.length) {
                    return controller.isLoading.value
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : SizedBox();
                  }
                  final data = controller.allPokemon[index];
                  final pokemonId = data.url!.split("/")[6];

                  return Column(
                    children: [
                      ListTile(
                        onTap: () => Get.toNamed(AppRoutes.pokemonDetailsScreen,
                            arguments: controller
                                .pokemonList.value!.results![index].url),
                        // arguments: data),
                        leading: Image.network(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$pokemonId.png",
                          height: 50,
                          width: 50,
                        ),
                        title: Text(
                          data.name.toString(),
                        ),
                        titleTextStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 15,
                        ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
