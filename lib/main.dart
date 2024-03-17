import 'package:flutter/material.dart';

import 'package:liveliness_app/ui/home_screen/home_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

Future<void> main() async {
  runApp(const CameraApp());
}

// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  /// Default Constructor
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (!controller.value.isInitialized) {
    //   return Container();
    // }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
