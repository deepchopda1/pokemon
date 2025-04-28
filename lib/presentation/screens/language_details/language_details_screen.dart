import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon/presentation/screens/language_details/controller/landuage_details_controller.dart';

class LanguageDetailsScreen extends StatefulWidget {
  const LanguageDetailsScreen({super.key});

  @override
  State<LanguageDetailsScreen> createState() => _LanguageDetailsScreenState();
}

class _LanguageDetailsScreenState extends State<LanguageDetailsScreen> {
  final LanguageDetailsController controller =
      Get.put(LanguageDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value ||
            controller.languageDetailsList.value == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final language = controller.languageDetailsList.value!;
        return Scaffold(
          appBar: AppBar(
            title: Text(language.name!.capitalize.toString()),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoTitle("Official", language.official! ? "Yes" : "No"),
                _buildInfoTitle("ISO 639 Code", language.iso639!),
                _buildInfoTitle("ISO 3166 Code", language.iso3166!),
                SizedBox(height: 20),
                Text(
                  "Translated Names",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: language.names!.length,
                  itemBuilder: (context, index) {
                    final data = language.names![index];
                    return ListTile(
                      leading: Icon(Icons.language),
                      title: Text(data.name.toString()),
                      subtitle: Text(
                        "Language Code: ${data.language!.name!.toUpperCase()}",
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoTitle(String title, String value) {
    return Row(
      children: [
        Text(
          "$title: ",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(child: Text(value))
      ],
    );
  }
}
