import 'dart:async';
import 'package:http/http.dart' as http;

class HttpHelper {
  static Future<http.Response> get(final String url) async {
    return await http.get(url);
  }
}
