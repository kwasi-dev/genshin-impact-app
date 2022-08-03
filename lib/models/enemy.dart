class Enemy{
  String name;
  int moraGained = 0;
  String id = "";
  String description = "";
  String region = "";
  String type = "";
  String family = "";
  String elements = "";


  Enemy(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat(){
    return name.replaceAll("-", " ");
  }
  
}