import 'package:concetto_app/screens/drawer/notifications.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Drawer(
        backgroundColor: Colors.black,
        width: width * 0.7,
        child: SafeArea(
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: CircleAvatar(radius: 50),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Divider(
                  color: Colors.white,
                  thickness: 1.2,
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen())),
                child: const ListTile(
                  title: Text(
                    'Notifications',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                  leading: Icon(Icons.notifications, color: Colors.white70),
                ),
              )
            ],
          ),
        ));
  }
}
