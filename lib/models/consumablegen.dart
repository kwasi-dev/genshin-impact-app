class Consumablegen {
  String name;
  int rarity = 0;
  String type = "";
  String effect = "";
  String description = "";
  String proficiency = "";
  String recipe = "";

  Consumablegen(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
