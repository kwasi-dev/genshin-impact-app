//The dashboard screen is used to contain the menu panel as well as the screen
// that's being displayed
import 'package:flutter/material.dart';
import 'package:genshinapp/screens/artifact_list.dart';
import 'package:genshinapp/screens/boss_list.dart';
import 'package:genshinapp/screens/consumablegen_list.dart';
import 'package:genshinapp/screens/domain_list.dart';
import 'package:genshinapp/screens/charactersgen_list.dart';
import 'package:genshinapp/screens/elementgen_list.dart';
import 'package:genshinapp/screens/enemy_list.dart';
import 'package:genshinapp/screens/materialgen_list.dart';
import 'package:genshinapp/screens/nation_list.dart';
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
                primary: false,
                children: [
                  ListTile(
                    title: const Text("Artifacts"),
                    onTap: () {
                      updateContent(
                          ArtifactListScreen(onItemClick: updateContent));
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
                      updateContent(CharactersgenListScreen(onItemClick: updateContent));
                    },
                  ),
                  ListTile(
                    title: const Text("Consumables"),
                    onTap: () {
                      updateContent(ConsumablegenListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Domains"),
                    onTap: () {
                      updateContent(DomainListScreen(onItemClick: updateContent));
                    },
                  ),
                  ListTile(
                    title: const Text("Elements"),
                    onTap: () {
                      updateContent(ElementgenListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Enemies"),
                    onTap: () {
                      updateContent(EnemyListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Materials"),
                    onTap: () {
                      updateContent(MaterialgenListScreen());
                    },
                  ),
                  ListTile(
                    title: const Text("Nations"),
                    onTap: () {
                      updateContent(NationListScreen());
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
