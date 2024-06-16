import 'package:dictionary/screens/home_screen.dart';
import 'package:dictionary/config/k_config.dart';
import 'package:dictionary/services/translation.dart';
import 'package:dictionary/states/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kode4u/screens/k_home_screen.dart';
import 'package:kode4u/screens/k_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put(AppState());
  setTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KMainScreen(translation: translation, pages: [
      GetPage(
        name: '/',
        page: () => KHomeScreen(
          child: HomeScreen(),
        ),
      ),
    ]);
  }
}
