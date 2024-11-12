import 'package:flutter/material.dart';
import 'package:pos_app/constants.dart';
import 'package:pos_app/helpers/app_helpers.dart';
import 'package:pos_app/providers/user_provider.dart';
import 'package:pos_app/widgets/global_widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userModel = context.read<UserProvider>().userModel;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Simple POS',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: appDrawer(context, userModel, (context) {
        // Show dialog
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Logout'),
                content: const Text('Are you sure you want to logout?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Logout user
                      logoutUser(context);
                    },
                    child: const Text('Logout'),
                  ),
                ],
              );
            });
      }),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Products',
                      style: TextStyle(
                        fontSize: Constants.fontExtraLarge,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: 4, // Update this based on the number of items
                      itemBuilder: (context, index) {
                        return _buildProductCard(
                          imageUrl:
                              'https://via.placeholder.com/150', // Replace with your image URL
                          title: index % 2 == 0
                              ? 'Crispy Dory Sambal'
                              : 'Orang kaya',
                          description: index % 2 == 0
                              ? 'Dory fish with spicy sambal sauce'
                              : 'Orang kaya dengan sambal sauce',
                          stock: 10,
                          price: 'USD 50.000',
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: Constants.paddingMedium,
              vertical: Constants.paddingMedium,
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(
                Constants.borderRadiusExtraLarge,
              ),
            ),
            margin: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.shopping_bag, color: Colors.white),
                    const SizedBox(width: 8.0),
                    Text(
                      "3 items",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Spacer(),
                const Text(
                  'Proceed to Checkout',
                  style: TextStyle(
                    fontSize: Constants.fontMedium,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String description,
    required int stock,
    required String price,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(Constants.borderRadiusMedium),
              child: Image.network(
                imageUrl,
                height: 100.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8.0),
            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: Constants.fontLarge,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis, // Avoid overflow by truncating
            ),
            const SizedBox(height: 4.0),
            // Description
            Expanded(
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: Constants.fontSmall,
                  color: Colors.grey,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis, // Truncate overflowing text
              ),
            ),
            const SizedBox(height: 8.0),
            // Row for stock and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Stock: $stock',
                  style: const TextStyle(
                    fontSize: Constants.fontSmall,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: Constants.fontSmall,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
