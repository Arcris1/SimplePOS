import 'package:flutter/material.dart';
import 'package:pos_app/constants.dart';
import 'package:dio/dio.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _addressController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _contactNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      try {
        final dio = Dio();
        Response response;
        response = await dio.post(Constants.registerUri, data: {
          'email': _emailController.text,
          'password': _passwordController.text,
          'firstName': _firstNameController.text,
          'lastName': _lastNameController.text,
          'contactNumber': _contactNumberController.text,
        });

        if (response.data['status'] == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Registration successful')),
          );
          Navigator.pushNamed(context, Constants.loginScreen);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text('Registration failed: ${response.data['message']}')),
          );
        }
      } catch (e) {
        print(e);
        // Handle exception
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: $e')),
        );
      }
    }
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
                        'Create Account',
                        style: TextStyle(
                          fontSize: Constants.fontExtraLarge,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: Constants.spacingMedium),
                      const Text(
                        'Sign up to get started',
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
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                labelText: 'First Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            TextFormField(
                              controller: _lastNameController,
                              decoration: InputDecoration(
                                labelText: 'Last Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
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
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            TextFormField(
                              controller: _confirmPasswordController,
                              decoration: InputDecoration(
                                labelText: 'Confirm Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            TextFormField(
                              controller: _contactNumberController,
                              decoration: InputDecoration(
                                labelText: 'Contact Number',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      Constants.borderRadiusMedium),
                                ),
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your contact number';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: Constants.spacingExtraLarge),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  _register();
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
                                  'Register',
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
                          const Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Constants.loginScreen);
                            },
                            child: const Text('Sign In'),
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
