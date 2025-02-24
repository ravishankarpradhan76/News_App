import 'package:get/get.dart';
import 'package:news_app/views/bottom_bar/bottom_bar_view.dart';
import '../views/details/details_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/', page: () => BottomNavBar()),
    GetPage(name: '/details', page: () => DetailsView()),
  ];
}