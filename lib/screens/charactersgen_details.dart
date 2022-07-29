import 'package:flutter/material.dart';
import 'package:genshinapp/models/charactersgen.dart';

class CharactersgenDetailScreen extends StatelessWidget {
  final Charactersgen charactersgen;
   const CharactersgenDetailScreen({Key? key, required  this.charactersgen}) : super(key: key);

@override
  Widget build(BuildContext context) {
     return Container(
      child: Text("I am the Characters detail screen. The characters you selected is ${charactersgen.name}"),
     );
  }
}