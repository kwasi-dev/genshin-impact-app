import 'package:flutter/material.dart';
import 'package:genshinapp/models/materialgen.dart';

class MaterialgenDetailScreen extends StatelessWidget {
  final Materialgen materialgen;
   const MaterialgenDetailScreen({Key? key, required  this.materialgen}) : super(key: key);

@override
  Widget build(BuildContext context) {
     return Container(
      child: Text("I am the Characters detail screen. The characters you selected is ${materialgen.name}"),
     );
  }
}