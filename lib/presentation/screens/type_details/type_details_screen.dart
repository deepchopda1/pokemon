import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/core/constant/app_strings.dart';
import 'package:pokemon/presentation/app/app_routes.dart';

import 'controller/type_details_controller.dart';

class TypeDetailsScreen extends StatefulWidget {
  const TypeDetailsScreen({super.key});

  @override
  State<TypeDetailsScreen> createState() => _TypeDetailsScreenState();
}

class _TypeDetailsScreenState extends State<TypeDetailsScreen> {
  final TypeDetailsController controller = Get.put(TypeDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value || controller.typeList.value == null) {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
      final type = controller.typeList.value!;
      return Scaffold(
        appBar: AppBar(
          title: Text(type.name!.capitalize.toString()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppString().damageRelations,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildDamageRelation(
                  AppString().doubleDamageFrom,
                  type.damageRelations!.doubleDamageFrom!,
                ),
                _buildDamageRelation(
                  AppString().doubleDamageTo,
                  type.damageRelations!.doubleDamageTo!,
                ),
                _buildDamageRelation(
                  AppString().halfDamageFrom,
                  type.damageRelations!.halfDamageFrom!,
                ),
                _buildDamageRelation(
                  AppString().halfDamageTo,
                  type.damageRelations!.halfDamageTo!,
                ),
                SizedBox(height: 15),
                Text(
                  AppString().pokemonWithThisType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: type.pokemon!.length,
                  itemBuilder: (context, index) {
                    final data = type.pokemon![index];
                    return ListTile(
                      // contentPadding: EdgeInsets.zero,
                      // onTap: () {
                      //   Get.toNamed(AppRoutes.languageDetailsScreen,
                      //       arguments: data.pokemon!.url);
                      // },
                      leading: Icon(Icons.catching_pokemon),
                      title: Text(data.pokemon!.name!.capitalize.toString()),
                    );
                  },
                ),
                SizedBox(height: 15),
                Text(
                  AppString().movesThisType,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: type.moves!.length,
                  itemBuilder: (context, index) {
                    final data = type.moves![index];
                    return ListTile(
                      leading: Icon(Icons.sports_martial_arts),
                      title: Text(data.name!.capitalize.toString()),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text(
                  "Language",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: type.names!.length,
                  itemBuilder: (context, index) {
                    final data = type.names![index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.languageDetailsScreen,
                            arguments: data.language!.url);
                      },
                      leading: Icon(Icons.language),
                      title: Text(data.name.toString()),
                      subtitle: Text(
                        "Language Code: ${data.language!.name!.toUpperCase()}",
                      ),
                      trailing: Icon(Icons.arrow_forward_ios_rounded, size: 15),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildDamageRelation(String title, List types) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Wrap(
          spacing: 08,
          children: types
              .map((type) => Chip(
                    label: Text(type.name),
                  ))
              .toList(),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
