import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {

  Future<T> fetchAndParseData<T>(String url, T Function(Map<String, dynamic> json) fromJson) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = jsonDecode(response.body);
        return fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Failed to fetch and parse data: $error');
    }
  }
}