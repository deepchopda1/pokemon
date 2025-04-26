import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/app/app_routes.dart';

import 'controller/ability_controller.dart';

class AbilityScreen extends StatefulWidget {
  const AbilityScreen({super.key});

  @override
  State<AbilityScreen> createState() => _AbilityScreenState();
}

class _AbilityScreenState extends State<AbilityScreen> {
  final AbilityController controller = Get.put(AbilityController());
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
        controller.fetchAbility(isNextPage: true);
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
          "Ability",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
        ),
      ),
      body: Obx(
        () => controller.abilityList.isEmpty && controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.separated(
                controller: scrollController,
                itemCount: controller.abilityList.length + 1,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  if (index == controller.abilityList.length) {
                    return controller.isLoading.value
                        ? Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : SizedBox();
                  }
                  final data = controller.abilityList[index];
                  return ListTile(
                    onTap: () {
                      Get.toNamed(AppRoutes.abilityDetailsScreen,
                          arguments: data.url);
                    },
                    title: Text(data.name.toString(),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 15),
                  );
                },
              ),
      ),
    );
  }
}
