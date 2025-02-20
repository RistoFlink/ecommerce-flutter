import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> manageHttpResponse({
  required http.Response response,
  required BuildContext context,
}) async {
  if (response.statusCode >= 200 && response.statusCode < 300) {
    // Success (2xx range)
    final Map<String, dynamic> responseData = jsonDecode(response.body);
    final String message =
        responseData['message'] as String? ?? "Request successful!";
    await showSnackBar(context, message);

    return {"success": true, "message": message, "data": responseData};
  } else {
    // Error
    final Map<String, dynamic> errorData = jsonDecode(response.body);
    final String errorMessage =
        errorData['message'] as String? ??
        errorData['error'] as String? ??
        "An unknown error occurred. Status code: ${response.statusCode}";
    await showSnackBar(context, errorMessage);
    return {"success": false, "message": errorMessage};
  }
}

Future<void> showSnackBar(BuildContext context, String message) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
