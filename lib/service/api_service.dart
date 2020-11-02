import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart';

class ApiService {
  Future<dynamic> get({String url, dynamic header}) async {
    var responseJson;
    Response response;
    try {
      response = await http.get(url, headers: header);

      responseJson = _response(response);
    } on SocketException {
      throw 'No Internet connection';
    } catch (e) {
      print(e.toString());
      throw "some error";
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    var responseJson = json.decode(response.body.toString());
    return responseJson;
  }
}
