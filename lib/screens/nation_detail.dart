import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/nation.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class NationDetailScreen extends StatelessWidget {
  final Nation nation;
  final Api genshinApi = Api();

  NationDetailScreen({Key? key, required this.nation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getNationDetail(nation.name),
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

            nation.name = responseData['name'];

            nation.element = responseData['element'];

            nation.archon = responseData['archon'];

            nation.controllingEntity = responseData['controlling entity'];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Name of Nation: ${nation.name}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Element: ${nation.element}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Archon: ${nation.archon}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Controlling Entity: ${nation.controllingEntity}"),
              ],
            );
          }
        }
      },
    );
  }
}
