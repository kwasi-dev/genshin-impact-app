class Weapon {
  String name;
  String type = "";
  int rarity = 0;
  int baseAttack = 0;
  String subStat = "";
  String passiveName = "";
  String passiveDesc = "";
  String location = "";
  String ascensionMaterial = "";

  Weapon(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
