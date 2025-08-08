import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pooleng/controllers/bottom_nav_bar_controller.dart';
import 'package:pooleng/views/dashboard_views/qr_scan_screen.dart';
import 'home_screen.dart';
import 'bookmark_screen.dart';

class BottomNavBar extends StatelessWidget {
  BottomNavBar({super.key});

  final MainNavController controller = Get.put(MainNavController());

  final List<Widget> pages = [
    const HomeScreen(),
    const BookmarkScreen(),
    const QrScanScreen(), // optional, if you want a screen for FAB
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: pages[controller.currentIndex.value],
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          // handle scan or navigation
          Get.snackbar("Scan", "FAB pressed");
          // Optionally change screen:
          // controller.changeTab(2);
        },
        child: Stack(
          children: [
            Image.asset('assets/images/qr_bg.png'),
            Center(child: Image.asset('assets/images/qr_scanner.png')),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: const Color(0xff1B1B1B),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => controller.changeTab(0),
                child: Image.asset(
                  controller.currentIndex.value == 0 ?   'assets/images/home_selected.png' :   'assets/images/home.png',
                  scale: 2,
                ),
              ),
              const SizedBox(width: 32), // space for FAB
              GestureDetector(
                onTap: () => controller.changeTab(1),
                child: Image.asset(
                  controller.currentIndex.value == 1 ?   'assets/images/bookmark_selected.png' :   'assets/images/bookmark.png',
                  scale: 2,

                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
