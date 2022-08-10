import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/enemies/enemy.dart';
import 'package:genshinapp/models/enemies/drops.dart';
import 'package:genshinapp/models/enemies/elements.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class EnemyDetailScreen extends StatelessWidget {
  final Enemy enemy;
  final Api genshinApi = Api();

  EnemyDetailScreen({Key? key, required this.enemy}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getEnemyDetail(enemy.name),
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

            enemy.name = responseData['name'];

            if (responseData.keys.contains('mora-gained')) {
              enemy.moraGained = responseData['mora-gained'];
            }

            //Check for drops before iterating
            if (responseData.keys.contains('drops')) {
              for (var dropsFromInternet in responseData['drops']) {
                Map<String, dynamic> dropsMapping = dropsFromInternet;

                Drops drops = Drops();
                if (responseData.keys.contains('name')) {
                  drops.name = dropsMapping['name'];
                }
                if (responseData.keys.contains('rarity')) {
                  drops.rarity = dropsMapping['rarity'];
                }
                if (responseData.keys.contains('minimum-level')) {
                  drops.minimumLevel = dropsMapping['minimum-level'];
                }

                enemy.drops.add(drops);
              }
            }

            enemy.id = responseData['id'];

            enemy.description = responseData['description'];

            enemy.region = responseData['region'];

            //Ternary operator / operation
            List<dynamic> elementsFromInternetList = responseData.keys
                    .contains('elements') //if responsedata keys has 'elements'
                ? responseData[
                    'elements'] // take the value in responseData['elements']
                : responseData.keys.contains(
                        'element') //else if response data keys has 'element'
                    ? responseData[
                        'element'] // take the value in responsedata['element']
                    : []; //else assign our variable to an empty list

            for (var element in elementsFromInternetList) {
              enemy.elements.add(element);
            }

            // enemy.elements = elementsFromInternetList;

            enemy.type = responseData['type'];

            enemy.family = responseData['family'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Name of Enemy: ${enemy.name}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Mora Gained: ${enemy.moraGained}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Id: ${enemy.id}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Description of Enemy: ${enemy.description}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Region: ${enemy.region}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Type: ${enemy.type}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Family: ${enemy.family}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Elements: ${enemy.elements}"),
                const SizedBox(
                  height: 20,
                ),
                // Text("Drops: ${enemy.drops}"),
                //Display drops
                ListView.builder(
                    itemCount: enemy.drops.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      Drops currentItem = enemy.drops[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "name: ${currentItem.name}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "rarity: ${currentItem.rarity}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "minimumLevel: ${currentItem.minimumLevel}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      );
                    })
              ],
            );
          }
        }
      },
    );
  }
}
