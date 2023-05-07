import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseService {

  final String _token = const String.fromEnvironment('API_TOKEN_ID') ?? '';

  Future<Map<String,dynamic>> getJsonData(String baseUrl, String endpoint, {Map<String,String>? queryParams }) async {

    final url = Uri.https( baseUrl, endpoint, await _generateAuthenticationQuery(queryParams));
    final response = await http.get(url);
    return json.decode(response.body);
  }

  Future<Map<String,dynamic>> postJsonData(String baseUrl, String endpoint, String body , {Map<String,String>? queryParams }) async {

    final url = Uri.https( baseUrl, endpoint, await _generateAuthenticationQuery(queryParams));
    final response = await http.post(
        url,
        body: body
    );
    return json.decode(response.body);
  }

  Future<Map<String, String>> _generateAuthenticationQuery (Map<String,String>? queryParams) async {

    if (queryParams!=null) {
      queryParams.addAll({
        'apiKey': _token
      });
    } else {
      queryParams = {
        'apiKey': _token
      };
    }
    return queryParams;
  }

}