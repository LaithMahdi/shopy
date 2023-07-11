import 'package:get/get.dart';
import 'package:shopy/view/screen/home/home.dart';

class BottomNavigationBarController extends GetxController {
  int selectedTab = 0;

  final List pages = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  changeTab(int index) {
    selectedTab = index;
    update();
  }
}
