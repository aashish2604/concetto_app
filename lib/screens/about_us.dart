import 'package:concetto_app/screens/team_members.dart';
import 'package:concetto_app/widgets/sponsors_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 32.0);

    const TextStyle descriptionTextStyle =
        TextStyle(color: Colors.white, fontSize: 18.0);

    const String aboutUsDescription =
        "CONCETTO-2022, the annual Techno-Management fest of IIT (ISM) Dhanbad will be organized from 21th to 23th October 2022, where every year, thousands of participants from all across the country come to compete in the largest techno-management fest of eastern India. Participants show their technical and management skills on one common platform, CONCETTO.";
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: headingStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    aboutUsDescription,
                    style: descriptionTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Sponsers',
                    style: headingStyle,
                  ),
                  const SizedBox(height: 20.0),
                  const SponsorList(
                    isMajorRequired: false,
                    gridPadding: EdgeInsets.zero,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  // const SizedBox(
                  //   height: 20.0,
                  // ),
                  // Text(
                  //   'Past Speakers',
                  //   style: headingStyle,
                  // ),
                  // const SizedBox(
                  //   height: 10.0,
                  // ),
                  // const Text(
                  //   'data',
                  //   style: descriptionTextStyle,
                  // ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const TeamMembers()));
                      },
                      child: const Text('View Core Team')),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
