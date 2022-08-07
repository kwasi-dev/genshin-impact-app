import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';
import '../models/enemies/enemy.dart';
import 'package:genshinapp/screens/enemy_detail.dart';

class EnemyListScreen extends StatelessWidget {
  void Function(Widget w) onItemClick;

  EnemyListScreen({Key? key, required this.onItemClick}) : super(key: key);
  final Api genshinApi = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: genshinApi.getEnemyList(),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
              child:
                  Text("You have lost internet connection. Please try again!"));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          // While we are loading data from the internet, show a loading
          // icon
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            // If an error has occurred (e.g if the user has an internet error,
            // Tell them that an error has occurred
            return const Center(
              child: Text("An error has occurred, please try again later"),
            );
          } else {
            // When we get data from the internet, convert it to a usable
            //format and display it in a list to the user

            //Convert internet response to a list
            List responseData = jsonDecode(snapshot.data!.body);

            //Convert list of data to enemys
            List<Enemy> enemyList = responseData.map((e) => Enemy(e)).toList();

            return ListView.builder(
              itemCount: enemyList.length,
              itemBuilder: (BuildContext context, int index) {
                // Get the current Enemy
                Enemy currentEnemy = enemyList[index];

                // SHow the Enemy information in a list tile
                return ListTile(
                  onTap: () {
                    // Domain detail screen should take the selected domain
                    // as a parameter so that it knows what domain it should
                    // display
                    onItemClick(EnemyDetailScreen(enemy: currentEnemy));
                  },
                  title: Text(currentEnemy.convertNameToHumanReadableFormat()),
                );
              },
            );
          }
        }
      },
    ));
  }
}
