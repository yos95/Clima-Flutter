import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:logger/logger.dart';

class NetworkHelper {
  NetworkHelper(this.url);
  var logger = Logger();
  final String url;
  Future getData() async {
    http.Response response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      logger.d('data recuperer');
      logger.d(convert.jsonDecode(response.body).toString());

      String data = response.body;
      return convert.jsonDecode(data);
    } else {
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
