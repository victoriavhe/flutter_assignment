import 'api_constant.dart';

class HomeEndpoint {
  static String getHomeResponse() {
    return "$baseURL"
        "/home";
  }
}