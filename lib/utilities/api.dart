import 'package:http/http.dart';

class Api{
  final Client client = Client();

  final String host = "api.genshin.dev";

  Future<Response> getDomainList() async{
    String domainListUrl = "domains";

    Response request = await client.get(Uri.https(host, domainListUrl));
    return request;
  }
}

