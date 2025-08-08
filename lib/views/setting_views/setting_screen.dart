import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0A0A0A), // very dark grey (top)
              Color(0xFF121212), // slightly lighter dark (bottom)
            ],
          ),
        ),
        child: Stack(
          children: [
            // Blue glow effect at bottom-left
            Positioned(
              left: -330,
              bottom: -170,
              child: Container(
                width: 600,
                height:600,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF3A78A6).withOpacity(0.7), // blue glow center
                      Colors.transparent, // fade out
                    ],
                    radius: 0.6,
                  ),
                ),
              ),
            ),
            Positioned(
              right: -300,
              top: -100,
              child: Container(
                width: 600,
                height:600,
                decoration:  BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      Color(0xFF3A78A6).withOpacity(0.9), // blue glow center
                      Colors.transparent, // fade out
                    ],
                    radius: 0.6,
                  ),
                ),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.arrow_back, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              "Settings",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const CircleAvatar(
                          backgroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Menu Items
                  buildMenuTile(Icons.language, "Change Language"),
                  buildMenuTile(Icons.privacy_tip, "Privacy Policy"),
                  buildMenuTile(Icons.description, "Terms & Conditions"),
                  buildMenuTile(Icons.info, "About Us"),
                  buildMenuTile(Icons.contact_mail, "Contact Us"),
                ],
              ),
            ),
          ],
        ),
      ),


    );
  }

  Widget buildMenuTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
        onTap: () {},
      ),
    );
  }
}
