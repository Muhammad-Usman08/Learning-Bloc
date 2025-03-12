import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginRepository {
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Uri url = Uri.parse('https://reqres.in/api/login');
    Map<String, String> data = {'email': email, 'password': password};

    try {
      final response = await http.post(url, body: data);
      final responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        return {'success': true, 'message': 'Login Successful!'};
      } else {
        return {'success': false, 'message': responseData['error']};
      }
    } catch (e) {
      return {'success': false, 'message': e.toString()};
    }
  }
}
