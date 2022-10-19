import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:concetto_app/models/merchendise_model.dart';
import 'package:concetto_app/screens/events_guests/events/events.dart';
import 'package:concetto_app/widgets/key_value_text.dart';
import 'package:concetto_app/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class MerchandiseDetails extends StatelessWidget {
  final MerchendiseModel merchandiseModel;
  const MerchandiseDetails({required this.merchandiseModel, super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleTextStyle =
        TextStyle(fontFamily: "orbitron", fontSize: 32.0, color: Colors.white);
    const TextStyle subTitleTextStyle =
        TextStyle(fontSize: 22.0, color: Colors.white70);
    final TextStyle headingTextStyle =
        GoogleFonts.oswald(color: Colors.white, fontSize: 32.0);
    final TextStyle summaryTextStyle =
        GoogleFonts.sourceCodePro(color: Colors.white, fontSize: 22.0);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          child: CachedNetworkImage(
                            height: 350,
                            width: double.infinity,
                            fit: BoxFit.fill,
                            imageUrl: merchandiseModel.image,
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
                        SafeArea(
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            merchandiseModel.name,
                            style: titleTextStyle,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          KeyValueText(
                              valueSize: 22,
                              keyText: 'Price',
                              valueText:
                                  '\u{20B9}${merchandiseModel.price.toString()}'),
                          const SizedBox(
                            height: 10,
                          ),
                          const Divider(
                            color: Colors.white60,
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            merchandiseModel.description,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                          merchandiseModel.url == null
                              ? const SizedBox(
                                  height: 20.0,
                                )
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 20.0),
                                  child: TextButton(
                                      onPressed: () async {
                                        Uri uri =
                                            Uri.parse(merchandiseModel.url!);
                                        launchUrl(uri,
                                            mode:
                                                LaunchMode.externalApplication);
                                      },
                                      child: const Text('Register')),
                                ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
