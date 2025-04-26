import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.typeList.value!.name!.capitalize.toString()),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Damage Relations',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                _buildDamageRelation(
                  "Double Damage From",
                  controller.typeList.value!.damageRelations!.doubleDamageFrom!,
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
          children: types
              .map((type) => Chip(
                    label: Text(type.name!.capitalize.toString()),
                  ))
              .toList(),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}
