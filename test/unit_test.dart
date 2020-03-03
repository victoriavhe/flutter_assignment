import 'package:flutter_assignment/model/home_response.dart';
import 'package:flutter_assignment/services/home_api.dart';
import 'package:flutter_assignment/services/home_endpoint.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockHome extends Mock implements http.Client {}

main() {
  HomeAPI api = HomeAPI();
  final client = MockHome();

  group("GET Request on Home", () {
    test("see if request success", () async {
      when(client.get(HomeEndpoint.getHomeResponse()))
          .thenAnswer((_) async => http.Response('{"data": "data"}', 200));

      expect(await api.getHomeResponse(), isInstanceOf<HomeResponse>());
    });
  });
}
