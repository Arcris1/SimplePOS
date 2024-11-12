import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pos_app/constants.dart';
import 'package:pos_app/providers/user_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  Future<void> checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    if (!isLoggedIn) {
      navigateToLogin();
    } else {
      // Navigator.pushNamedAndRemoveUntil(
      //     context, Constants.homeScreen, (route) => false);
      setUserDetails();
    }
  }

  // Set user details to provider from shared preferences
  void setUserDetails() async {
    final prefs = await SharedPreferences.getInstance();
    final user = jsonDecode(prefs.getString('user')!);
    setUserModel(user);
  }

  // set user model to provider
  void setUserModel(Map<String, dynamic> userDetails) {
    // watch to the UserProvider
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    userProvider.setUserModel(userDetails);

    if (userProvider.isSuccess) {
      Navigator.pushNamedAndRemoveUntil(
          context, Constants.homeScreen, (route) => false);
    } else {
      navigateToLogin();
    }
  }

  void navigateToLogin() {
    Navigator.pushNamedAndRemoveUntil(
        context, Constants.loginScreen, (route) => false);
  }

  @override
  void initState() {
    super.initState();
    delayedFunction();
  }

  // Create delayed function
  Future<void> delayedFunction() async {
    await Future.delayed(const Duration(seconds: 2));
    checkLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to POS Igop',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
