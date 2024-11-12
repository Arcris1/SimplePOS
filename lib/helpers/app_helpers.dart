// show snackbar
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

// logout user
void logoutUser(BuildContext context) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
}
