//The dashboard screen is used to contain the menu panel as well as the screen
// that's being displayed
import 'package:flutter/material.dart';
import 'package:genshinapp/screens/artifact_list.dart';
import 'package:genshinapp/screens/domain_list.dart';
import 'package:genshinapp/screens/characters_list.dart';

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
                    onTap: () {
                      updateContent(ArtifactListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Boss"),
                    onTap: () {
                      updateContent(BossListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Characters"),
                    onTap: () {
                      updateContent(CharactersListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Consumables"),
                    onTap: () {
                      updateContent(ConsumablesListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Domains"),
                    onTap: () {
                      updateContent(DomainListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Elements"),
                    onTap: () {
                      updateContent(ElementsListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Enemies"),
                    onTap: () {
                      updateContent(EnemiesListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Materials"),
                    onTap: () {
                      updateContent(MaterialsListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Nations"),
                    onTap: () {
                      updateContent(NationsListScreen());
                    },
                  ),
                  ListTile(
                    title: Text("Weapons"),
                    onTap: () {
                      updateContent(WeaponsListScreen());
                    },
                  )
                ],
              ),
            ),
            Expanded(child: content)
          ],
        ));
  }

  void updateContent(Widget newContent) {
    setState(() {
      content = newContent;
    });
  }
}
