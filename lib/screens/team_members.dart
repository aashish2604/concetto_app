import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/team_members_model.dart';
import 'package:concetto_app/repository/team_members_repository.dart';
import 'package:concetto_app/screens/events_guests/events/events.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/glassmorphic_container.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:concetto_app/widgets/slashbox.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamMembers extends StatelessWidget {
  const TeamMembers({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle headingStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 32.0);
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Team Members',
                    style: headingStyle,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                FutureBuilder(
                    future: TeamMembersRepository().getTeamMembers(),
                    builder: (context,
                        AsyncSnapshot<List<TeamMembersModel>?> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.data != null) {
                          if (snapshot.data!.isNotEmpty) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  mainAxisExtent: 190.0,
                                ),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  if (index % 2 == 0) {
                                    return CoreTeamMemberCard1(
                                        teamMembersModel:
                                            snapshot.data![index]);
                                  } else {
                                    return CoreTeamMemberCard2(
                                        teamMembersModel:
                                            snapshot.data![index]);
                                  }
                                },
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                'No Data Found',
                                style: TextStyle(color: Colors.white),
                              ),
                            );
                          }
                        } else {
                          return const Center(
                            child: Text(
                              'No Data Found',
                              style: TextStyle(color: Colors.white),
                            ),
                          );
                        }
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const LoadingWidget();
                      } else {
                        return const Center(
                            child: Text(
                          'Some error occured',
                          style: TextStyle(color: Colors.white),
                        ));
                      }
                    }),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  'App is made with ❤ by',
                  style: headingStyle.copyWith(fontSize: 26.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                AppMakersCard(
                    fontSize: 22.0,
                    height: 330,
                    width: SizeConfig.instance.screenWidth * 0.72,
                    imageSize: 230,
                    name: 'Aashish Ranjan Singh',
                    fb: 'https://www.facebook.com/aashishranjan.singh.14',
                    insta: 'https://www.instagram.com/aashishsingh.26',
                    linkedin:
                        'https://www.linkedin.com/in/aashish-ranjan-singh-9848091b9',
                    iconSize: 30.0,
                    imageUrl: 'assets/images/aashish_dp.jpeg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppMakersCard(
                        fontSize: 16.0,
                        iconSize: 24.0,
                        height: 300,
                        width: SizeConfig.instance.screenWidth * 0.45,
                        name: 'Tarun Shrivastava',
                        insta: 'http://www.instagram.com/taruns_0108',
                        fb: 'https://www.facebook.com/tarun.shrivastava.501598',
                        linkedin:
                            'https://www.linkedin.com/in/tarun-shrivastava-661b69201',
                        imageUrl: 'assets/images/tarun_dp.jpg'),
                    AppMakersCard(
                        fontSize: 16.0,
                        iconSize: 24.0,
                        height: 300,
                        width: SizeConfig.instance.screenWidth * 0.45,
                        name: 'Ansh Tandon',
                        insta: 'https://www.instagram.com/ansh.tandon.98',
                        fb: 'https://www.facebook.com/ansh.tandon.98',
                        linkedin:
                            'https://www.linkedin.com/in/ansh-tandon-68871b178',
                        imageUrl: 'assets/images/ansh_dp.jpeg')
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CoreTeamMemberCard1 extends StatelessWidget {
  final TeamMembersModel teamMembersModel;
  const CoreTeamMemberCard1({required this.teamMembersModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 22.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    return GlassMorphicListTile(
      height: 190,
      width: double.infinity,
      child: Center(
        child: Row(
          children: [
            SizedBox(
              child: CachedNetworkImage(
                height: double.infinity,
                width: SizeConfig.instance.screenWidth * 0.4,
                fit: BoxFit.fill,
                imageUrl: teamMembersModel.image,
                placeholder: (context, url) =>
                    const Center(child: LoadingWidget()),
                errorWidget: (context, url, error) {
                  try {
                    return const CachedNetworkImageError();
                  } on Exception catch (e) {
                    return const CachedNetworkImageError();
                  }
                },
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(teamMembersModel.name, style: titleTextStyle),
                    Text(
                      teamMembersModel.designation,
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                Uri routeUri = Uri(
                                    scheme: 'tel',
                                    path: '+91${teamMembersModel.contact}');
                                launchUrl(routeUri);
                              },
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        IconButton(
                            onPressed: () {
                              Uri uri = Uri.parse(teamMembersModel.linkedIn);
                              launchUrl(uri);
                            },
                            icon: const FaIcon(
                              size: 40,
                              FontAwesomeIcons.linkedin,
                              color: Colors.blue,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CoreTeamMemberCard2 extends StatelessWidget {
  final TeamMembersModel teamMembersModel;
  const CoreTeamMemberCard2({required this.teamMembersModel, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: 22.0, fontWeight: FontWeight.w600);
    final TextStyle subtitleTextStyle = GoogleFonts.manrope(
        color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w400);
    return GlassMorphicListTile(
      height: 190,
      width: double.infinity,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      teamMembersModel.name,
                      style: titleTextStyle,
                    ),
                    Text(
                      teamMembersModel.designation,
                      style: subtitleTextStyle,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.blue,
                          child: IconButton(
                              onPressed: () {
                                Uri routeUri = Uri(
                                    scheme: 'tel',
                                    path: '+91${teamMembersModel.contact}');
                                launchUrl(routeUri);
                              },
                              icon: const Icon(
                                Icons.phone,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        IconButton(
                            onPressed: () {
                              Uri uri = Uri.parse(teamMembersModel.linkedIn);
                              launchUrl(uri);
                            },
                            icon: const FaIcon(
                              size: 40,
                              FontAwesomeIcons.linkedin,
                              color: Colors.blue,
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 10.0,
            ),
            SizedBox(
              child: CachedNetworkImage(
                height: double.infinity,
                width: SizeConfig.instance.screenWidth * 0.4,
                fit: BoxFit.fill,
                imageUrl: teamMembersModel.image,
                placeholder: (context, url) =>
                    const Center(child: LoadingWidget()),
                errorWidget: (context, url, error) {
                  try {
                    return const CachedNetworkImageError();
                  } on Exception catch (e) {
                    return const CachedNetworkImageError();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppMakersCard extends StatelessWidget {
  final double height;
  final double? width;
  final String name;
  final String imageUrl, insta, fb, linkedin;
  final double fontSize;
  final double iconSize;
  final double? imageSize;
  const AppMakersCard(
      {required this.height,
      this.imageSize,
      this.width,
      required this.iconSize,
      required this.name,
      required this.fontSize,
      required this.insta,
      required this.fb,
      required this.linkedin,
      required this.imageUrl,
      super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleTextStyle = GoogleFonts.quantico(
        color: kBrightCyan, fontSize: fontSize, fontWeight: FontWeight.w600);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: BorderedSlashBox(
        height: height,
        padding: EdgeInsets.zero,
        width: width ?? height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: imageSize ?? height * 0.6,
              child: Image(
                image: AssetImage(imageUrl),
                fit: BoxFit.fill,
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 2.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: titleTextStyle,
                      ),
                    ])),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(fb);
                        launchUrl(uri);
                      },
                      icon: FaIcon(
                        size: iconSize,
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                      )),
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(insta);
                        launchUrl(uri);
                      },
                      icon: FaIcon(
                        size: iconSize,
                        FontAwesomeIcons.instagram,
                        color: Colors.purple,
                      )),
                  IconButton(
                      onPressed: () {
                        Uri uri = Uri.parse(linkedin);
                        launchUrl(uri);
                      },
                      icon: FaIcon(
                        size: iconSize,
                        FontAwesomeIcons.linkedin,
                        color: Colors.blue,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
