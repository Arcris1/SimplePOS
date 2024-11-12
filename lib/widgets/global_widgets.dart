import 'package:flutter/material.dart';
import 'package:pos_app/constants.dart';
import 'package:pos_app/models/user_model.dart';

Widget appDrawer(BuildContext context, UserModel? userModel,
    void Function(BuildContext) logoutUser) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: Constants.borderRadiusLarge,
                backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/29754865?v=4',
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                "${userModel!.lastName!}, ${userModel.firstName!}",
                style: const TextStyle(
                  fontSize: Constants.fontMedium,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Admin',
                style: TextStyle(
                  fontSize: Constants.fontSmall,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Home'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: const Text('Orders'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        // Products
        ListTile(
          leading: const Icon(Icons.shopping_cart),
          title: const Text('Products'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () {
            logoutUser(context);
          },
        ),
      ],
    ),
  );
}
