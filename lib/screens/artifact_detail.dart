import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/artifact.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class ArtifactDetailScreen extends StatelessWidget {
  final Artifact artifact;
  final Api genshinApi = Api();

  ArtifactDetailScreen({Key? key, required  this.artifact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getArtifactDetail(artifact.name),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.none){
          return const Center(
            child: Text("You have no internet. Please check your connection"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError){
            return const Center(
              child: Text("An error has occurred, please try again later"),
            );
          }
          else {
            Map<String, dynamic> responseData = jsonDecode(snapshot.data!.body);

            artifact.maxRarity = responseData['max_rarity'];

            if (responseData.keys.contains('1-piece_bonus')){
              artifact.onePcBonus = responseData['1-piece_bonus'];
            }

            if (responseData.keys.contains('2-piece_bonus')){
              artifact.twoPcBonus = responseData['2-piece_bonus'];
            }

            if (responseData.keys.contains('4-piece_bonus')){
              artifact.fourPcBonus = responseData['4-piece_bonus'];
            }


            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                Text("Name of artifact: ${artifact.name}"),
                const SizedBox(height: 20,),
                Text("Max Rarity: ${artifact.maxRarity}"),
                const SizedBox(height: 20,),
                Text("One piece Bonus: ${artifact.onePcBonus}"),
                const SizedBox(height: 20,),
                Text("Two piece Bonus: ${artifact.twoPcBonus}"),
                const SizedBox(height: 20,),
                Text("Four piece bonus: ${artifact.fourPcBonus}")
              ],
            );
          }
        }

      },
    );
  }
}
