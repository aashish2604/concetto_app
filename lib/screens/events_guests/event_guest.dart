import 'package:concetto_app/screens/events_guests/events/events.dart';
import 'package:concetto_app/screens/events_guests/guests/guest_talks.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class EventsGuests extends StatefulWidget {
  const EventsGuests({super.key});

  @override
  State<EventsGuests> createState() => _EventsGuestsState();
}

class _EventsGuestsState extends State<EventsGuests> {
  final screens = [Events(), GuestTalks()];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/app_background.jpeg'),
              fit: BoxFit.fill)),
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GNav(
                backgroundColor: Colors.black,
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade900,
                gap: 12,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                padding: const EdgeInsets.all(16),
                onTabChange: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                tabs: const [
                  GButton(
                    icon: Icons.event,
                    text: 'Events',
                  ),
                  GButton(
                    icon: Icons.mic,
                    text: 'Guest Talks',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
