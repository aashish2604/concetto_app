import 'package:concetto_app/screens/core_team.dart';
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
        "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.";

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
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'data',
                    style: descriptionTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Past Speakers',
                    style: headingStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'data',
                    style: descriptionTextStyle,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ViewCoreTeam()));
                      },
                      child: const Text('View Core Team'))
                ],
              ),
            ),
          )),
    );
  }
}
