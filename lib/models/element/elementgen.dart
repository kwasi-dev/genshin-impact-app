import 'package:genshinapp/models/element/reaction.dart';

class Elementgen {
  String name;
  String key = "";
  List<Reactions> reaction = [];
  

  Elementgen(this.name);

  //The name that is retrieved from the internet has dashes in it.
  // Replace all the dashes with spaces so that the user will see
  // sensible information on the user interface
  String convertNameToHumanReadableFormat() {
    return name.replaceAll("-", " ");
  }
}
