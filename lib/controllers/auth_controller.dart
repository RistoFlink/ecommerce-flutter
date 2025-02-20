import 'package:store_app/global_variables.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/services/manage_http_responses.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class AuthController {
  Future<Map<String, dynamic>> signUpUsers({
    required BuildContext context,
    required String email,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> userData = {
        "_id": '', // MongoDB will generate this
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
      };

      final Map<String, dynamic> requestBody = {
        ...userData,
        "password": password,
      };

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        body: jsonEncode(requestBody),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      // Check if the widget is still mounted *before* using the context.
      if (!context.mounted) return {"success": false, "message": "Cancelled"};

      return await manageHttpResponse(response: response, context: context);
    } catch (e) {
      print("Error during signup: $e");
      return {"success": false, "message": "An error occurred: $e"};
    }
  }
}
