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

  Future<Response> getCharactergenList() async{
    String characterListUrl = "characters";

    Response request = await client.get(Uri.https(host, characterListUrl));
    return request;
  }

  Future<Response> getConsumablegenList() async{
    String consumableListUrl = "consumables";

    Response request = await client.get(Uri.https(host, consumableListUrl));
    return request;
  }

  Future<Response> getElementgenList() async{
    String elementListUrl = "elements";

    Response request = await client.get(Uri.https(host, elementListUrl));
    return request;
  }

  Future<Response> getEnemyList() async{
    String enemyListUrl = "enemies";

    Response request = await client.get(Uri.https(host, enemyListUrl));
    return request;
  }

  Future<Response> getMaterialgenList() async{
    String materialgenListUrl = "materials";

    Response request = await client.get(Uri.https(host, materialgenListUrl));
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

  Future<Response> getArtifactDetail(String artifactName)async{
    String artifactDetailUrl = "artifacts/$artifactName";

    Response request = await client.get(Uri.https(host, artifactDetailUrl));
    return request;

  }
  Future<Response> getDomainDetail(String domainName)async{
    String domainDetailUrl = "domain/$domainName";

    Response request = await client.get(Uri.https(host, domainDetailUrl));
    return request;

  }
}
