import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/team_members_model.dart';
import 'package:concetto_app/repository/team_members_repository.dart';
import 'package:concetto_app/services/configs/size_config.dart';
import 'package:concetto_app/services/theme/custom_colors.dart';
import 'package:concetto_app/widgets/glassmorphic_container.dart';
import 'package:concetto_app/widgets/loading.dart';
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
                              child: Expanded(
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
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 76.0,
                  ),
                ),
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
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error_outline,
                    size: 76.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
