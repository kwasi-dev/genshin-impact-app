import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';
import '../models/boss.dart';

class BossListScreen extends StatelessWidget {
  BossListScreen({Key? key}) : super(key: key);
  final Api genshinApi = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: genshinApi.getBossList(),
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

            //Convert list of data to bosss
            List<Boss> bossList = responseData.map((e) => Boss(e)).toList();

            return ListView.builder(
              itemCount: bossList.length,
              itemBuilder: (BuildContext context, int index) {
                // Get the current Boss
                Boss currentBoss = bossList[index];

                // SHow the Boss information in a list tile
                return ListTile(
                  title: Text(currentBoss.convertNameToHumanReadableFormat()),
                );
              },
            );
          }
        }
      },
    ));
  }
}
