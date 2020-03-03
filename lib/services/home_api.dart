import 'dart:convert';

import 'package:flutter_assignment/helper/http_helper.dart';
import 'package:flutter_assignment/model/home_response.dart';
import 'package:flutter_assignment/services/home_endpoint.dart';

class HomeAPI {
  Future<HomeResponse> getHomeResponse() async {
    final response = await requestOfGET(HomeEndpoint.getHomeResponse());
    print("response ${response.body}");
    return HomeResponse.fromJson(json.decode(response.body));
  }
}