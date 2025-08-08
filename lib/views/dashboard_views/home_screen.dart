import 'package:flutter/material.dart';
import 'package:pooleng/utils/app_colors.dart';
import 'package:pooleng/views/setting_views/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List categories = [
      {
        "title": "Commercial",
        "count": 10,
        "color": Colors.lightBlue.shade300,
        "icon": Icons.business,
      },
      {
        "title": "Healthcare",
        "count": 25,
        "color": Colors.grey.shade200,
        "icon": Icons.health_and_safety,
        "textColor": AppColors.black,
      },
      {
        "title": "Industrial",
        "count": 16,
        "color": Colors.blue,
        "icon": Icons.factory,
      },
      {
        "title": "Transportation",
        "count": 8,
        "color": Colors.amberAccent,
        "icon": Icons.local_shipping,
        "textColor": AppColors.black,
        "isLast": true,
      },
      {
        "title": "Transportation",
        "count": 8,
        "color": Colors.red,
        "icon": Icons.local_shipping,
        "textColor": AppColors.black,
        "isLast": true,
      },
      {
        "title": "Transportation",
        "count": 8,
        "color": Colors.blue,
        "icon": Icons.local_shipping,
        "textColor": AppColors.black,
        "isLast": true,
      },
      {
        "title": "Transportation",
        "count": 8,
        "color": Colors.green,
        "icon": Icons.local_shipping,
        "textColor": AppColors.black,
        "isLast": true,
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,
                bottom: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/grid.png', scale: 4),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen(),));
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.settings, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        'Welcome to',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 5),
                      Image.asset('assets/images/stroke2.png', scale: 2),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      const Text(
                        'Abu Dhabi ',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Image.asset('assets/images/building.png', scale: 1.5),
                    ],
                  ),
                  Image.asset('assets/images/stroke1.png', scale: 1.5),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero, // add top space for visual layout

              itemCount: categories.length,
              itemBuilder: (context, index) {
                double offset = index * -25.0; // adjust for overlap height

                return Transform.translate(
                  offset: Offset(0, offset),
                  child: categoryCard(
                    categories[index]['title'],
                    categories[index]['count'],
                    categories[index]['color'],
                    categories[index]['icon'],

                    context,
                    textColor: index % 2 == 1 ? AppColors.black : AppColors.white,
                    isLast: index == categories.length - 1,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget categoryCard(
    String title,
    int count,
    Color color,
    IconData icon,
    BuildContext context, {
    Color textColor = Colors.white,
    bool isLast = false,
  }) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height:  MediaQuery.sizeOf(context).height * 0.14,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: isLast
              ? BorderRadius.circular(30)
              : const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.white.withOpacity(.2),
                  child: Icon(icon, color: textColor),
                ),
                Spacer(),
                Text(
                  'View All',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_outward, color: textColor, size: 12),
              ],
            ),
            SizedBox(height: 5),
            Row(
              children: [
                Text(title, style: TextStyle(color: textColor, fontSize: 18)),
                Spacer(),
                Text(
                  '$count places',
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
