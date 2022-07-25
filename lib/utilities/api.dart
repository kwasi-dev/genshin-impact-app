import 'package:http/http.dart';

class Api {
  final Client client = Client();

  final String host = "api.genshin.dev";

  Future<Response> getDomainList() async {
    String domainListUrl = "domains";

    Response request = await client.get(Uri.https(host, domainListUrl));
    return request;
  }

  Future<Response> getArtifactList() async {
    String artifactListUrl = "artifacts";

    Response request = await client.get(Uri.https(host, artifactListUrl));
    return request;
  }

  Future<Response> getBossList() async{
    String bossListUrl = "boss";

    Response request = await client.get(Uri.https(host, bossListUrl));
    return request;
  }

  Future<Response> getCharacterList() async{
    String characterListUrl = "characters";

    Response request = await client.get(Uri.https(host, characterListUrl));
    return request;
  }

  Future<Response> getConsumableList() async{
    String consumableListUrl = "consumables";

    Response request = await client.get(Uri.https(host, consumableListUrl));
    return request;
  }

  Future<Response> getElementList() async{
    String elementListUrl = "elements";

    Response request = await client.get(Uri.https(host, elementListUrl));
    return request;
  }

  Future<Response> getEnemyList() async{
    String enemyListUrl = "enemies";

    Response request = await client.get(Uri.https(host, enemyListUrl));
    return request;
  }

  Future<Response> getMaterial_genList() async{
    String material_genListUrl = "materials";

    Response request = await client.get(Uri.https(host, material_genListUrl));
    return request;
  }

  Future<Response> getNationList() async{
    String nationListUrl = "nations";

    Response request = await client.get(Uri.https(host, nationListUrl));
    return request;
  }

  Future<Response> getWeaponList() async{
    String weaponListUrl = "weapons";

    Response request = await client.get(Uri.https(host, weaponListUrl));
    return request;
  }
}
