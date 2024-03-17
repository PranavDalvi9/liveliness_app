import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:liveliness_app/common/app_text.dart';
import 'package:liveliness_app/ui/home_screen/allow_block.dart';
import 'package:liveliness_app/ui/home_screen/enable_camera.dart';
import 'package:liveliness_app/ui/home_screen/live_test_pass.dart';
import 'package:liveliness_app/ui/home_screen/photo_capture.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CameraDescription> cameras = [];
  int isLivelinessScreen = 0;
  Future<void> camm() async {
    //main function
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      debugPrint('CameraError: ${e.description}');
    }
  }

  late CameraController controller;

  clickCam() {
    // init state
    controller = CameraController(cameras[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isLivelinessScreen = 1;
      });
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    camm();
    // clickCam();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100),
          Container(
            height: 65,
            color: const Color(0xFF1D1C1C),
            child: Row(
              children: [
                const SizedBox(width: 20),
                SvgPicture.asset('assets/images/text_logo_icon.svg'),
                const SizedBox(width: 18),
                Image.asset('assets/images/Keev Logo.png'),
                const Spacer(),
                SvgPicture.asset('assets/images/notification_icon.svg'),
                const SizedBox(width: 14),
                SvgPicture.asset('assets/images/search_icon.svg'),
                const SizedBox(width: 20),
              ],
            ),
          ),
          isLivelinessScreen == 0
              ? EnableCamera(
                  onTap: clickCam,
                )
              : isLivelinessScreen == 1 || isLivelinessScreen == 99
                  ? AllowBlock(
                      onTapCapture: () {
                        setState(() {
                          isLivelinessScreen = -1;
                        });
                      },
                      onTapCancel: () {
                        setState(() {
                          isLivelinessScreen = 0;
                        });
                      },
                      onTap: () {
                        setState(() {
                          isLivelinessScreen = 99;
                        });
                      },
                      isLivelinessScreen: isLivelinessScreen,
                      controller: controller,
                    )
                  : isLivelinessScreen == 2
                      ? const LiveTestPassed()
                      : const PhotoCapture(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 58,
        color: const Color(0xFF103566),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: cross,
          children: [
            Column(
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset('assets/images/my_keev_logo.svg'),
                const SizedBox(height: 4),
                const AppText(
                  title: 'My KEEV',
                  fontSize: 10,
                  titleColor: Colors.white,
                ),
                const SizedBox(height: 8),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset('assets/images/apply_now_logo.svg'),
                const SizedBox(height: 4),
                const AppText(
                  title: 'Apply Now',
                  fontSize: 10,
                  titleColor: Colors.white,
                ),
                const SizedBox(height: 8),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset('assets/images/credit_card_logo.svg'),
                const SizedBox(height: 4),
                const AppText(
                  title: 'Credit Card',
                  fontSize: 10,
                  titleColor: Colors.white,
                ),
                const SizedBox(height: 8),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset('assets/images/request_service_log.svg'),
                const SizedBox(height: 4),
                const AppText(
                  title: 'Service Request',
                  fontSize: 10,
                  titleColor: Colors.white,
                ),
                const SizedBox(height: 8),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 7),
                SvgPicture.asset('assets/images/investment_logo.svg'),
                const SizedBox(height: 4),
                const AppText(
                  title: 'Investment',
                  fontSize: 10,
                  titleColor: Colors.white,
                ),
                const SizedBox(height: 8),
              ],
            )
          ],
        ),
      ),
    );
  }
}
