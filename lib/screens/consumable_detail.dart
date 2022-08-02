import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/consumablegen.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class ConsumablegenDetailScreen extends StatelessWidget {
  final Consumablegen consumablegen;
  final Api genshinApi = Api();

  ConsumablegenDetailScreen({Key? key, required this.consumablegen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getConsumablegenDetail(consumablegen.name),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: Text("You have no internet. Please check your connection"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error has occurred, please try again later"),
            );
          } else {
            Map<String, dynamic> responseData = jsonDecode(snapshot.data!.body);

            consumablegen.rarity = responseData['rarity'];

            consumablegen.name = responseData['name'];

            consumablegen.type = responseData['type'];

            consumablegen.effect = responseData['effect'];

            consumablegen.description = responseData['description'];

            consumablegen.proficiency = responseData['proficiency'];

            consumablegen.recipe = responseData['recipe'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Name of Consumable: ${consumablegen.name}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Rarity: ${consumablegen.rarity}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Type: ${consumablegen.type}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Effect: ${consumablegen.effect}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Description: ${consumablegen.description}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Proficiency: ${consumablegen.proficiency}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Recipe: ${consumablegen.recipe}")
              ],
            );
          }
        }
      },
    );
  }
}
