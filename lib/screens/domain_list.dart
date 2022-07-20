import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:genshinapp/models/domain.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';

class DomainListScreen extends StatelessWidget {
  DomainListScreen({Key? key}) : super(key: key);
  final Api genshinApi = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future: genshinApi.getDomainList(),
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
                return const Center(
                  child: Text("An error has occurred, please try again later"),
                );
              } else {
                //Convert internet response to a list
                List responseData = jsonDecode(snapshot.data!.body);

                //Convert list of data to domains
                List<Domain> domainList = responseData.map((e) => Domain(e)).toList();

                return ListView.builder(
                  itemCount: domainList.length,
                  itemBuilder: (BuildContext context, int index) {
                    // Get the current domain
                    Domain currentDomain = domainList[index];

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
