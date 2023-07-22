import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopy/api/end%20point/api_link.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String jwtToken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjkwMDE2ODI4LCJpYXQiOjE2OTAwMTY1MjgsImp0aSI6IjViMGZkY2YzYzE4MDRhODBiYzg0NWI5MDUyNDcwOGRiIiwidXNlcl9pZCI6MX0.eUkshbO14-PQsBjhB6M8RLEeWRH00CfEmFvIrxZTX_4"; // Replace this with your actual JWT token.

  Future<void> fetchUserId() async {
    try {
      const url = ApiLink.getUser;
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $jwtToken',
        },
      );

      if (response.statusCode == 200) {
        final userData = jsonDecode(response.body);
        int userId =
            userData['id']; // Assuming the user ID is returned as 'id'.
        print('User ID: $userId');
        // You can now use the user ID in your Flutter app as needed.
      } else {
        print('Failed to get user ID: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: fetchUserId,
          child: const Text('Get User ID'),
        ),
      ),
    );
  }
}
