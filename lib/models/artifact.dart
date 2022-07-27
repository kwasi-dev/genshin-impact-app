class Artifact{
  String name;
  int maxRarity = 0;
  String onePcBonus = "";
  String twoPcBonus = "";
  String fourPcBonus = "";

  Artifact(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat(){
    return name.replaceAll("-", " ");
  }
  
}