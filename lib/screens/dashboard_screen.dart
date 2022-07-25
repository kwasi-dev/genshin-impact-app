//The dashboard screen is used to contain the menu panel as well as the screen
// that's being displayed
import 'package:flutter/material.dart';
import 'package:genshinapp/screens/artifact_list.dart';
import 'package:genshinapp/screens/domain_list.dart';
import 'package:genshinapp/screens/charactersgen_list.dart';
import 'package:genshinapp/screens/weapon_list.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Widget content = Container(
    child: const Text("The content we select from the menu will go here"),
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
                    title: const Text("Artifacts"),
                    onTap: () {
                      updateContent(ArtifactListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Boss"),
                    onTap: () {
                      updateContent(BossListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Characters"),
                    onTap: () {
                      updateContent(CharctersgenListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Consumables"),
                    onTap: () {
                      updateContent(ConsumablesListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Domains"),
                    onTap: () {
                      updateContent(DomainListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Elements"),
                    onTap: () {
                      updateContent(ElementsListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Enemies"),
                    onTap: () {
                      updateContent(EnemiesListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Materials"),
                    onTap: () {
                      updateContent(MaterialsgenListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Nations"),
                    onTap: () {
                      updateContent(NatioListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Weapons"),
                    onTap: () {
                      updateContent(WeaponListScreen());
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
