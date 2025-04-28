import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/app/app_routes.dart';

import 'controller/ability_details_controller.dart';

class AbilityDetailsScreen extends StatefulWidget {
  const AbilityDetailsScreen({super.key});

  @override
  State<AbilityDetailsScreen> createState() => _AbilityDetailsScreenState();
}

class _AbilityDetailsScreenState extends State<AbilityDetailsScreen> {
  final AbilityDetailsController controller =
      Get.put(AbilityDetailsController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value ||
          controller.abilityDetails.value == null) {
        return Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }

      final ability = controller.abilityDetails.value!;
      return Scaffold(
        appBar: AppBar(
          title: Text(
            controller.abilityDetails.value!.name!.capitalize.toString(),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Effect",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 08),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ability.effectEntries!.length,
                  itemBuilder: (context, index) {
                    final data = ability.effectEntries![index];
                    return Text(data.effect.toString());
                  },
                ),
                SizedBox(height: 20),
                Text('Pokemon with this Ability',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 08),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ability.pokemon!.length,
                  itemBuilder: (context, index) {
                    final data = ability.pokemon![index];
                    return ListTile(
                      // onTap: () {
                      //   Get.toNamed(AppRoutes.pokemonDetailsScreen,
                      //       arguments: data.pokemon!.url);
                      // },
                      title: Text(data.pokemon!.name.toString()),
                      // trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    );
                  },
                ),
                SizedBox(height: 20),
                Text('Language',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 08),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: ability.names!.length,
                  itemBuilder: (context, index) {
                    final data = ability.names![index];
                    return ListTile(
                      onTap: () {
                        Get.toNamed(AppRoutes.languageDetailsScreen,
                            arguments: data.language!.url);
                      },
                      title: Text(data.language!.name.toString()),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
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
}
