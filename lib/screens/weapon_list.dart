import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';
import '../models/weapon.dart';

class WeaponListScreen extends StatelessWidget {
  WeaponListScreen({Key? key}) : super(key: key);
  final Api genshinApi = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: genshinApi.getWeaponList(),
          builder: (BuildContext context, AsyncSnapshot<Response> snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              // While we are loading data from the internet, show a loading
              // icon
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            else {
              if (snapshot.hasError){
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

                //Convert list of data to weapons
                List<Weapon> weaponList = responseData.map((e) => Weapon(e)).toList();

                return ListView.builder(
                  itemCount: weaponList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Get the current domain
                    Weapon currentDomain = weaponList[index];

                    // SHow the domain information in a list tile
                    return ListTile(
                      title: Text(currentDomain.convertNameToHumanReadableFormat()),
                    );
                  },
                );
              }
            }
          },
        )
    );
  }
}
