import 'package:flutter/material.dart';
import 'package:genshinapp/models/charactersgen.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CharactersgenDetailScreen extends StatelessWidget {
  final Charactersgen characters;
   final Api genshinApi = Api();

   CharactersgenDetailScreen({Key? key, required  this.characters}) : super(key: key);

@override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getCharactersgenDetail(characters.name),
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

            characters.vision = responseData['vision'];
           
            characters.weapon = responseData['weapon'];

            characters.nation = responseData['nation'];

            characters.affiliation = responseData['affiliation'];

            characters.rarity = responseData['rarity'];

            characters.constellation = responseData['constellation'];

            characters.birthday = responseData['birthday'];

            characters.description = responseData['description'];
            
             return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text("Name of character: ${characters.name}"),
                const SizedBox(height: 20,),
                Text("Vision: ${characters.vision}"),
                const SizedBox(height: 20,),
                Text("Weapon: ${characters.weapon}"),
                const SizedBox(height: 20,),
                Text("Nation: ${characters.nation}"),
                const SizedBox(height: 20,),
                Text("Affiliation: ${characters.affiliation}"),
                const SizedBox(height: 20,),
                Text("Max Rarity: ${characters.rarity}"),
                const SizedBox(height: 20,),
                Text("Constellation: ${characters.constellation}"),
                const SizedBox(height: 20,),
                Text("Birthday: ${characters.birthday}"),
                const SizedBox(height: 20,),
                Text("Description: ${characters.description}"),
              ],
            );
          }
        }
      },
    );
  }
}
