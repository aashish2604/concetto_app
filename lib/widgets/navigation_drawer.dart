import 'package:concetto_app/screens/drawer/notifications.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Row followUsLabel = Row(children: <Widget>[
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 10.0, right: 15.0),
            child: const Divider(
              thickness: 1,
              color: Colors.white70,
              height: 50,
            )),
      ),
      const Text(
        "Follow us on",
        style: TextStyle(color: Colors.white70),
      ),
      Expanded(
        child: Container(
            margin: const EdgeInsets.only(left: 15.0, right: 10.0),
            child: const Divider(
              thickness: 1,
              color: Colors.white70,
              height: 50,
            )),
      ),
    ]);

    double width = MediaQuery.of(context).size.width;

    return Drawer(
        backgroundColor: Colors.black,
        width: width * 0.7,
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                child: GestureDetector(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                AssetImage('assets/images/concetto_logo.png'))),
                  ),
                  onTap: () {
                    Uri uri = Uri.parse("https://concetto.in/");
                    launchUrl(uri);
                  },
                ),
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
              ),
              const Expanded(child: SizedBox()),
              followUsLabel,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(
                            "https://www.facebook.com/Concettoiitdhanbad/");
                        launchUrl(uri);
                      },
                      icon: const FaIcon(
                        size: 30,
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(
                            "https://www.instagram.com/concetto.iitism/?hl=en");
                        launchUrl(uri);
                      },
                      icon: const FaIcon(
                        size: 30,
                        FontAwesomeIcons.instagram,
                        color: Colors.purple,
                      )),
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(
                            "https://www.linkedin.com/company/concetto-iitism-dhanbad/");
                        launchUrl(uri);
                      },
                      icon: const FaIcon(
                        size: 30,
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                      )),
                  // IconButton(
                  //     onPressed: () {
                  //       Uri uri = Uri.parse("https://concetto.in/");
                  //       launchUrl(uri);
                  //     },
                  //     icon: const FaIcon(
                  //       size: 40,
                  //       FontAwesomeIcons.globe,
                  //       color: Colors.blue,
                  //     )),
                ],
              ),
              const SizedBox(
                height: 20.0,
              )
            ],
          ),
        ));
  }
}
