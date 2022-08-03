import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/enemy.dart';
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

            enemy.moraGained = responseData['mora gained'];

            enemy.id = responseData['id'];

            enemy.description = responseData['description'];

            enemy.region = responseData['region'];

            enemy.elements = responseData['elements'];

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
              ],
            );
          }
        }
      },
    );
  }
}
