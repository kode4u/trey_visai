import 'dart:math';

import 'package:dictionary/states/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:get/get.dart';
import 'package:kode4u/configs/k_config.dart';
import 'package:kode4u/utils/k_utils.dart';
import 'package:torch_light/torch_light.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _hasPermissions = false;
  bool _hasFlashlight = false;
  bool _flashlight_on = false;

  @override
  void initState() {
    super.initState();
    initFlashlight();
  }

  initFlashlight() async {
    try {
      final isTorchAvailable = await TorchLight.isTorchAvailable();
      setState(() {
        _hasFlashlight = isTorchAvailable;
      });
    } on Exception catch (_) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'app_name'.tr,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed('/setting');
              },
              icon: const Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ))
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Builder(
        builder: (context) {
          return _buildCompass();
        },
      ),
      bottomNavigationBar: Get.find<AppState>().ads.bannerWidget(),
    );
  }

  Widget _buildCompass() {
    return Center(
      child: StreamBuilder<CompassEvent>(
        stream: FlutterCompass.events,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error reading heading: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          double direction = snapshot.data!.heading!;
          var width = MediaQuery.of(context).size.width - 50;
          return GestureDetector(
            onTap: () async {
              setState(() {
                _flashlight_on = !_flashlight_on;
              });
              if (_flashlight_on) {
                try {
                  await TorchLight.enableTorch();
                } on Exception catch (_) {
                  // Handle error
                }
              } else {
                try {
                  await TorchLight.disableTorch();
                } on Exception catch (_) {
                  // Handle error
                }
              }
            },
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: width,
              height: width,
              alignment: Alignment.center,
              decoration: _flashlight_on
                  ? BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(360)),
                      color: KColor.d_bg_color,
                      border: Border.all(
                        width: 1, //                   <--- border width here
                      ),
                    )
                  : null,
              child: Transform.rotate(
                angle: ((direction) * (pi / 180) * -1),
                child: Image.asset(KUtil.isKh()
                    ? 'assets/images/compass.png'
                    : 'assets/images/compass_en.png'),
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget _buildPermissionSheet() {
  //   return Center(
  //     child: Column(
  //       mainAxisSize: MainAxisSize.min,
  //       children: <Widget>[
  //         const Text('Location Permission Required'),
  //         ElevatedButton(
  //           child: const Text('Request Permissions'),
  //           onPressed: () {},
  //         ),
  //         const SizedBox(height: 16),
  //         ElevatedButton(
  //           child: const Text('Open App Settings'),
  //           onPressed: () {},
  //         )
  //       ],
  //     ),
  //   );
  // }

  // void _fetchPermissionStatus() async {
  //   if (await Permission.locationWhenInUse.request().isGranted) {
  //     print('permission granted');
  //     _hasPermissions = true;
  //   } else {
  //     print('permission denied.');
  //     _hasPermissions = false;
  //   }
  // }
}
