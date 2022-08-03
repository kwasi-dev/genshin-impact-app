import 'package:flutter/material.dart';
import 'package:genshinapp/models/elementgen.dart';

class ElementgenDetailScreen extends StatelessWidget {
  final Elementgen elementgen;
   const ElementgenDetailScreen({Key? key, required  this.elementgen}) : super(key: key);

@override
  Widget build(BuildContext context) {
     return Container(
      child: Text("I am the Element detail screen. The element you selected is ${elementgen.name}"),
     );
  }
}