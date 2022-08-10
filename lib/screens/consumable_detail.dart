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

            List<String> foods = responseData.keys.toList();
            List<Consumablegen> consumables = [];

            for (var food in foods) {
              Consumablegen consumablegen = Consumablegen(food);

              consumablegen.rarity = responseData[food]['rarity'];

              consumablegen.name = responseData[food]['name'];

              consumablegen.type = responseData[food]['type'];

              consumablegen.effect = responseData[food]['effect'];

              consumablegen.description = responseData[food]['description'];

              //consumablegen.proficiency = responseData[food]['proficiency'];

              consumables.add(consumablegen);
            }

            List<String> potions = responseData.keys.toList();
            List<Consumablegen> consumable = [];

            for (var potions in potions) {
              Consumablegen consumablegen = Consumablegen(potions);

              consumablegen.rarity = responseData[potions]['rarity'];

              consumablegen.name = responseData[potions]['name'];

              consumablegen.effect = responseData[potions]['effect'];

              consumables.add(consumablegen);
            }

            return ListView.builder(
                itemCount: consumables.length,
                itemBuilder: (context, index) {
                  Consumablegen potions = consumable[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Name of Potion: ${potions.name}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Rarity: ${potions.rarity}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Effect: ${potions.effect}"),
                    ],
                  );
                });

            //consumablegen.recipe = responseData['recipe'];

            return ListView.builder(
                itemCount: consumables.length,
                itemBuilder: (context, index) {
                  Consumablegen food = consumables[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Name of Consumable: ${food.name}"),
                      const SizedBox(
                        height: 20,
                      ),
                      //Text("Rarity: ${consumablegen.rarity}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Type: ${food.type}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Effect: ${food.effect}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Description: ${food.description}"),
                      const SizedBox(
                        height: 20,
                      ),
                      Text("Rarity: ${food.rarity}"),
                      const SizedBox(height: 20),
                      //Text("Proficiency: ${consumablegen.proficiency}"),
                      const SizedBox(
                        height: 20,
                      ),
                      //Text("Recipe: ${consumablegen.recipe}")
                    ],
                  );
                });
          }
        }
      },
    );
  }
}
