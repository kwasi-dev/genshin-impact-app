//The dashboard screen is used to contain the menu panel as well as the screen
// that's being displayed
import 'package:flutter/material.dart';
import 'package:genshinapp/screens/artifact_list.dart';
import 'package:genshinapp/screens/domain_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  Widget content = Container(
    child: Text("The content we select from the menu will go here"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Genshin Companion app"),
          centerTitle: true,
        ),
        body: Row(
          children: [
            SizedBox(
              width: 200,
              child: ListView(
                children: [
                  ListTile(
                    title: Text("Artifacts"),
                    onTap: (){
                      updateContent(ArtifactListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Boss"),
                  ),
                  ListTile(
                    title: Text("Characters"),
                  ),
                  ListTile(
                    title: Text("Consumables"),
                  ),
                  ListTile(
                    title: Text("Domains"),
                    onTap: (){
                      updateContent(DomainListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Elements"),
                  ),
                  ListTile(
                    title: Text("Enemies"),
                  ),
                  ListTile(
                    title: Text("Materials"),
                  ),
                  ListTile(
                    title: Text("Nations"),
                  ),
                  ListTile(
                    title: Text("Weapons"),
                  )
                ],
              ),
            ),
            Expanded(
                child: content)
          ],
        )
    );
  }

  void updateContent(Widget newContent){
    setState((){
      content = newContent;
    });
  }
}
