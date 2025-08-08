import 'package:get/get.dart';
import 'package:pooleng/views/dashboard_views/home_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.home, page: () => HomeScreen()),
  ];

}
