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

  Future<Response> getBossList() async {
    String bossListUrl = "boss";

    Response request = await client.get(Uri.https(host, bossListUrl));
    return request;
  }

  Future<Response> getCharactersList() async {
    String charactersListUrl = "characters";

    Response request = await client.get(Uri.https(host, charactersListUrl));
    return request;
  }

  Future<Response> getConsumablesList() async {
    String consumablesListUrl = "consumables";

    Response request = await client.get(Uri.https(host, consumablesListUrl));
    return request;
  }

  Future<Response> getElementsList() async {
    String elementsListUrl = "elements";

    Response request = await client.get(Uri.https(host, elementsListUrl));
    return request;
  }

  Future<Response> getEnemiesList() async {
    String enemiesListUrl = "enemies";

    Response request = await client.get(Uri.https(host, enemiesListUrl));
    return request;
  }

  Future<Response> getMaterialsList() async {
    String materialsListUrl = "materials";

    Response request = await client.get(Uri.https(host, materialsListUrl));
    return request;
  }

  Future<Response> getNationsList() async {
    String nationsListUrl = "nations";

    Response request = await client.get(Uri.https(host, nationsListUrl));
    return request;
  }

  Future<Response> getWeaponsList() async {
    String weaponsListUrl = "weapons";

    Response request = await client.get(Uri.https(host, weaponsListUrl));
    return request;
  }
}
