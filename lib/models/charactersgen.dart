class Charactersgen {
  String name;
  String vision = "";
  String weapon = "";
  String nation = "";
  String affiliation = "";
  int rarity = 0;
  String constellation = "";
  String birthday = "";
  String description = "";

  Charactersgen(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
