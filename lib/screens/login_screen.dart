import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pos_app/constants.dart';
import 'package:pos_app/helpers/app_helpers.dart';
import 'package:pos_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final dio = Dio();
        Response response;
        response = await dio.post(Constants.loginUri, data: {
          'email': _emailController.text,
          'password': _passwordController.text,
        });

        if (response.data['status'] == 'success') {
          // Show snackbar
          _showSnackBar("Login successful");
          // Save user details to provider
          _saveUserDetails(response.data['data']);
          // Save token to secure storage
          _saveToken(response.data['access_token']);
          // Redirect to home screen
          _redirectToHome();
        } else {
          _showSnackBar("Please check your credentials");
        }
      } catch (e) {
        _showSnackBar("An error occurred. Please try again later");
      }
    }
  }

  // show snackbar
  void _showSnackBar(String message) {
    showSnackBar(context, message);
  }

  // Redirect to home screen
  void _redirectToHome() {
    Navigator.pushNamedAndRemoveUntil(
        context, Constants.homeScreen, (route) => false);
  }

  // Save user details to provider
  void _saveUserDetails(Map<String, dynamic> userDetails) async {
    final userProvider = context.read<UserProvider>();
    userProvider.setUserModel(userDetails);
    // save it also it to shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user', jsonEncode(userDetails));
    // set user to logged in
    await prefs.setBool('isLoggedIn', true);
  }

  // Save token to secure storage adjust if you are using ios
  void _saveToken(String token) async {
    final userProvider = context.read<UserProvider>();
    userProvider.setToken(token);
    // save it also it to shared preferences
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.spacingLarge),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: Constants.spacingLarge),
                      const Text(
                        'Welcome Back',
                        style: TextStyle(
                          fontSize: Constants.fontExtraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMedium),
                      const Text(
                        'Sign in to continue',
                        style: TextStyle(
                          fontSize: Constants.fontMedium,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: Constants.spacingLarge),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            TextFormField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _login();
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: Constants.paddingMedium),
                                  backgroundColor:
                                      Theme.of(context).primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Constants.borderRadiusMedium),
                                  ),
                                ),
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: Constants.fontMedium,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Constants.registerScreen);
                            },
                            child: const Text('Sign Up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
