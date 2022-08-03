import 'package:flutter/material.dart';
import 'package:genshinapp/models/characters/charactersgen.dart';
import 'package:genshinapp/models/characters/constellation.dart';
import 'package:genshinapp/models/characters/passivetalent.dart';
import 'package:genshinapp/models/characters/skilltalent.dart';
import 'package:genshinapp/models/characters/upgrade.dart';
import 'package:genshinapp/utilities/api.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CharactersgenDetailScreen extends StatelessWidget {
  final Charactersgen characters;
  final Api genshinApi = Api();

  CharactersgenDetailScreen({Key? key, required this.characters})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: genshinApi.getCharactersgenDetail(characters.name),
      builder: (BuildContext context, AsyncSnapshot<Response> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) {
          return const Center(
            child: Text("You have no internet. Please check your connection"),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          if (snapshot.hasError) {
            return const Center(
              child: Text("An error has occurred, please try again later"),
            );
          } else {
            Map<String, dynamic> responseData = jsonDecode(snapshot.data!.body);

            characters.name = responseData['name'];
            characters.vision = responseData['vision'];

            characters.weapon = responseData['weapon'];

            characters.nation = responseData['nation'];

            characters.affiliation = responseData['affiliation'];

            characters.rarity = responseData['rarity'];

            characters.constellationname = responseData['constellation'];

            characters.birthday = responseData['birthday'];

            characters.description = responseData['description'];

            for (var skillTalentFromInternet in responseData['skillTalents']) {
              Map<String, dynamic> skillTalentMapping = skillTalentFromInternet;

              SkillTalent talent = SkillTalent();
              talent.name = skillTalentMapping['name'];
              talent.unlock = skillTalentMapping['unlock'];
              talent.description = skillTalentMapping['description'];
              if (skillTalentMapping.keys.contains('type')) {
                talent.type = skillTalentMapping['type'];
              }
              characters.skillTalents.add(talent);

              if (skillTalentMapping.keys.contains('upgrades')) {
                for (var upgradeFromMapping in skillTalentMapping['upgrades']) {
                  Map<String, dynamic> upgradeMapping = upgradeFromMapping;
                  Upgrade upgrade = Upgrade();
                  upgrade.name = upgradeMapping['name'];
                  upgrade.value = upgradeMapping['value'];

                  talent.upgrades.add(upgrade);
                }
              }
            }

            for (var passiveTalentFromInternet
                in responseData['passiveTalents']) {
              Map<String, dynamic> passiveTalentMapping =
                  passiveTalentFromInternet;
              PassiveTalent passive = PassiveTalent();
              passive.name = passiveTalentMapping['name'];
              passive.unlock = passiveTalentMapping['unlock'];
              passive.description = passiveTalentMapping['description'];
              if (passiveTalentMapping.keys.contains('type')) {
                passive.level = passiveTalentMapping['level'];
              }
            }
            for (var constellationFromInternet
                in responseData['constellations']) {
              Map<String, dynamic> constellationMapping =
                  constellationFromInternet;
              Constellation constellation = Constellation();
              constellation.name = constellationMapping['name'];
              constellation.unlock = constellationMapping['unlock'];
              constellation.description = constellationMapping['description'];
              constellation.level = constellationMapping['level'];
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text("Name of character: ${characters.name}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Vision: ${characters.vision}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Weapon: ${characters.weapon}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Nation: ${characters.nation}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Affiliation: ${characters.affiliation}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Max Rarity: ${characters.rarity}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Constellation: ${characters.constellationname}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Birthday: ${characters.birthday}"),
                const SizedBox(
                  height: 20,
                ),
                Text("Description: ${characters.description}"),
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.skillTalents.length,
                    itemBuilder: (BuildContext context, int index) {
                      SkillTalent talent = characters.skillTalents[index];

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text("Skill Tallent Name: ${talent.name}"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text("Skill Tallent: ${talent.type}"),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                                "Skill Tallent Description: ${talent.description}"),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: talent.upgrades.length,
                              itemBuilder: (BuildContext context, int index) {
                                Upgrade upgrade = talent.upgrades[index];
                                return ListTile(
                                  title: Text(upgrade.name),
                                  subtitle: Text(talent.type),
                                );
                              },
                            )
                          ]);
                    },
                  ),
                )
              ],
            );
          }
        }
      },
    );
  }
}
