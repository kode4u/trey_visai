//config data
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kode4u/configs/k_config.dart';

setTheme() {
  KConfig.margin = 8.0;
  KConfig.radius = 8.0;
  KConfig.ads = {
    'app': Platform.isAndroid
        ? 'ca-app-pub-6380644639947620~9954243592'
        : Platform.isIOS
            ? 'ca-app-pub-6380644639947620~9510049271'
            : '',
    'banner': Platform.isAndroid
        ? 'ca-app-pub-6380644639947620/2430976792'
        : Platform.isIOS
            ? 'ca-app-pub-6380644639947620/8196967603'
            : '',
    'inter': Platform.isAndroid
        ? 'ca-app-pub-6380644639947620/3907709999'
        : Platform.isIOS
            ? 'ca-app-pub-6380644639947620/4257722598'
            : '',
  };
  KConfig.android_package = 'com.kode4u.treyvisay';
  KConfig.ios_package = 'trey-visay-khmer-compass/id1509743285';

//config theme data
  KColor.l_primary_l_color = const Color(0xFF64B5F6);
  KColor.l_primary_color = Colors.blue;
  KColor.l_primary_d_color = const Color(0xFF1976D2);
  KColor.l_unselected_color = Colors.grey;
  KColor.l_text_color = Colors.black;
  KColor.l_bg_l_color = const Color(0xFFFFFFFF);
  KColor.l_bg_color = const Color(0xFFf2f2f7);
  KColor.l_bg_d_color = const Color(0xFFe3e3e8);
  KColor.d_primary_color = const Color(0xFF0049FF);
  KColor.d_unselected_color = Colors.grey;
  KColor.d_text_color = Colors.white;
  KColor.d_bg_l_color = const Color(0xFF000000);
  KColor.d_bg_color = const Color(0xFF2f3239);
  KColor.d_bg_d_color = const Color(0xFF1d2025);
}
