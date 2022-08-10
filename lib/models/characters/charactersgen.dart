import 'package:genshinapp/models/characters/constellation.dart';
import 'package:genshinapp/models/characters/passivetalent.dart';
import 'package:genshinapp/models/characters/skilltalent.dart';

class Charactersgen {
  String name;
  String char_name = "";
  String vision = "";
  String weapon = "";
  String nation = "";
  String affiliation = "";
  int rarity = 0;
  String constellationname = "";
  String birthday = "";
  String description = "";
  List<SkillTalent> skillTalents = [];
  List<PassiveTalent> passiveTalent = [];
  List<Constellation> constellation = [];
  Charactersgen(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
