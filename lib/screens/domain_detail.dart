import 'package:flutter/material.dart';
import 'package:genshinapp/models/domain.dart';

class DomainDetailScreen extends StatelessWidget {
  final Domain domain;
   const DomainDetailScreen({Key? key, required  this.domain}) : super(key: key);

@override
  Widget build(BuildContext context) {
     return Container(
      child: Text("I am the Domain detail screen. The domain you selected is ${domain.name}"),
     );
  }
}