import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/weapon.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class WeaponDetailScreen extends StatelessWidget {
  final Weapon weapon; 
  final Api genshinApi = Api(); 

  WeaponDetailScreen({Key? key, required this.weapon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getWeaponDetail(weapon.name),
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

            weapon.name = responseData['name'];

            weapon.type = responseData['type'];

            weapon.rarity = responseData['rarity'];

            weapon.baseAttack = responseData['base attack'];

            weapon.subStat = responseData['sub stat'];

            weapon.passiveName = responseData['passive name'];

            weapon.passiveDesc = responseData['passive dec'];

            weapon.location = responseData['location'];

            weapon.ascensionMaterial = responseData['ascension material'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Name of Weapon: ${weapon.name}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Type: ${weapon.type}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Rarity: ${weapon.rarity}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Base Attack: ${weapon.baseAttack}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Sub Stat: ${weapon.subStat}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Passive Name: ${weapon.passiveName}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Passive Description: ${weapon.passiveDesc}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Location: ${weapon.location}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Ascension Material: ${weapon.ascensionMaterial}"),

              ],
            );
          }
        }
      },
    );
  }
}