import 'package:http/http.dart' as http;

Future<http.Response> requestOfGET(url) async {
  print("--> GET $url");

  final response = await http.get(url);
  return response;
}