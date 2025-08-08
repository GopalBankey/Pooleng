import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pooleng/controllers/connectivity_controller.dart';
import 'package:pooleng/routes/app_pages.dart';
import 'package:pooleng/views/connectivity_view/connectivity_banner.dart';
import 'package:pooleng/views/splash_views/splash_screen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(ConnectivityController());

  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pooleng',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      getPages: AppPages.routes,

      builder: (context, child) {
        return Stack(
          children: [
            child!,
            const Positioned(bottom: 0, child: BottomConnectivityBanner()),
          ],
        );
      },
    );
  }
}
