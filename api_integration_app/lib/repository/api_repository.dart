import 'dart:convert';
import 'dart:io';

import 'package:api_integration_app/models/api_response_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<List<ApiResponseModel>> fetchData() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      if (response.statusCode == 200) {
        final body = json.decode(response.body) as List;
        return body.map((e) {
          return ApiResponseModel(
              userId: e['userId'],
              id: e['id'],
              title: e['title'],
              body: e['body']);
        }).toList();
      }
    } on SocketException {
      throw Exception('Error Fetching Data');
    }
    throw Exception('Error Fetching Data');
  }
}
