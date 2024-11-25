import 'package:Afaq/ui/common/assets.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Profile Section
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Text(
              'Gokul Ravichandran',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                SizedBox(width: 4),
                Text(
                  '4.8',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(
                  AppImages.profileLogo), // Replace with your image path
            ),
            otherAccountsPictures: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.grey),
                onPressed: () {
                  // Handle edit profile
                  print('Edit profile tapped!');
                },
              ),
            ],
          ),

          // Menu Items
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.car_rental),
                  title: Text('Booking Page'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Booking Page tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.business_center),
                  title: Text('Trip Details'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Trip Details tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.payment),
                  title: Text('Payment'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Payment tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Trip History'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Trip History tapped!');
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Handle navigation
                    print('Settings tapped!');
                  },
                ),
              ],
            ),
          ),

          // Logout Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(Icons.power_settings_new, color: Colors.red),
                SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    // Handle logout
                    print('Logout tapped!');
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
