import 'dart:convert';

class UserAuth {
  final String baseUrl = 'http://localhost:8080/api/user'; // Replace with your backend API URL

  UserAuth();

  Future<Map<String, dynamic>?> loginUser(String email, String password) async {
  final response = await http.post(
    Uri.parse('$baseUrl/login'),
    body: jsonEncode({'email': email, 'password': password}),
    headers: {'Content-Type': 'application/json'},
  );

  print('API Response: ${response.statusCode} - ${response.body}');

  if (response.statusCode == 201) {
    final responseData = jsonDecode(response.body);
    if (responseData.containsKey('emailPresent')) {
      final userData = responseData['emailPresent'];
      await _saveUserData(userData);
      print('USERAUTH DATA: $userData');
      return responseData;
    }
  }

  return null; // Return null on error or if the response structure is unexpected
}


  Future<String?> signupUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: jsonEncode(userData),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      final userData = jsonDecode(response.body);
      await _saveUserData(userData);
      return response.body;
    } else {
      return null; // Return null on error instead of throwing an exception
    }
  }

  // Save user data to shared preferences
  Future<void> _saveUserData(Map<String, dynamic> userData) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('userData', jsonEncode(userData));
  }

  // Get user data from shared preferences
  Future<Map<String, dynamic>?> getStoredUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userDataString = prefs.getString('userData');
    print("Data: $userDataString");
    return userDataString != null ? jsonDecode(userDataString) : null;
  }
}
