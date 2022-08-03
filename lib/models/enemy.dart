class Enemy {
  String name;
  int moraGained = 0;
  int id = 0;
  String description = "";
  String region = "";
  String elements = "";
  String type = "";
  String family = "";

  Enemy(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
