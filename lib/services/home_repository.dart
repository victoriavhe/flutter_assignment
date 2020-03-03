import 'package:flutter_assignment/model/home_response.dart';

import 'home_api.dart';

class HomeRepository {
  final HomeAPI _homeAPI = HomeAPI();

  Future<HomeResponse> fetchHomeResponse() => _homeAPI.getHomeResponse();
}