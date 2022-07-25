import 'package:flutter/material.dart';
import 'package:genshinapp/models/artifact.dart';

class ArtifactDetailScreen extends StatelessWidget {
  final Artifact artifact;

  const ArtifactDetailScreen({Key? key, required  this.artifact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("I am the artifact detail screen. The artifact you selected is ${artifact.name}"),
    );
  }
}
