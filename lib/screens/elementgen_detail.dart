import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/element/elementgen.dart';
import 'package:genshinapp/models/element/reaction.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class ElementgenDetailScreen extends StatelessWidget {
  final Elementgen elementgen;
  final Api genshinApi = Api();

  ElementgenDetailScreen({Key? key, required this.elementgen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getElementgenDetail(elementgen.name),
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

            elementgen.name = responseData['name'];

            for (var reactionFromInternet in responseData['reactions']) {
              Map<String, dynamic> reactionMapping = reactionFromInternet;

              Reactions reaction = Reactions();
              reaction.name = reactionMapping['name'];
              //reaction.elements = reactionMapping['elements'];
              
              reaction.name = reactionMapping['description'];
            }

            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Name of Elements: ${elementgen.name}"),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                      itemCount: elementgen.reaction.length,
                      itemBuilder: (BuildContext context, int index) {
                        Reactions reaction = elementgen.reaction[index];
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text("Reactions Name: ${reaction.name}"),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              // Text("Reactions elements: ${reaction.elements}"),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                  "Reactions description: ${reaction.description}"),
                            ]);
                      })
                ]);
          }
        }
      },
    );
  }
}
