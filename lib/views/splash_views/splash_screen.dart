import 'package:flutter/material.dart';
import 'package:pooleng/views/dashboard_views/bottom_nav_bar.dart';
import 'package:pooleng/views/dashboard_views/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.sizeOf(context).width;
    final height  = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen background image
          SizedBox.expand(
            child: Image.asset(
              'assets/images/splash.png',
              fit: BoxFit.cover,
            ),
          ),

          // Bottom-center button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:  EdgeInsets.only(bottom: height * .06),
              child:  InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavBar()));
                },
                child: Container(
                  width: width * .72,
                  height: height * .06,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff5192C0).withOpacity(0.8),
                        spreadRadius: 15,
                        blurRadius: 50,

                  ),],),
                  child: Center(child: Row(
                    spacing: 10,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Get Started Now',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                      Icon(Icons.north_east_rounded,color: Colors.white,size: 15,)
                    ],
                  )),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
