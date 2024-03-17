import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liveliness_app/common/app_text.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class AllowBlock extends StatefulWidget {
  final VoidCallback onTap;
  final VoidCallback onTapCapture;
  final VoidCallback onTapCancel;
  final int isLivelinessScreen;
  final CameraController controller;
  const AllowBlock(
      {super.key,
      required this.onTap,
      required this.onTapCancel,
      required this.isLivelinessScreen,
      required this.controller,
      required this.onTapCapture});

  @override
  State<AllowBlock> createState() => _AllowBlockState();
}

class _AllowBlockState extends State<AllowBlock> {
  String url1 = '';
  // late Position position;
  // String? _currentAddress;
  // Position? _currentPosition;
  // getLoc() async {
  //   position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  // }

  @override
  void initState() {
    // TODO: implement initState
    // getLoc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> _handleLocationPermission() async {
    //   bool serviceEnabled;
    //   LocationPermission permission;

    //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
    //   if (!serviceEnabled) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location services are disabled. Please enable the services')));
    //     return false;
    //   }
    //   permission = await Geolocator.checkPermission();
    //   if (permission == LocationPermission.denied) {
    //     permission = await Geolocator.requestPermission();
    //     if (permission == LocationPermission.denied) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //           const SnackBar(content: Text('Location permissions are denied')));
    //       return false;
    //     }
    //   }
    //   if (permission == LocationPermission.deniedForever) {
    //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
    //         content: Text(
    //             'Location permissions are permanently denied, we cannot request permissions.')));
    //     return false;
    //   }
    //   return true;
    // }

    // Future<void> _getCurrentPosition() async {
    //   final hasPermission = await _handleLocationPermission();
    //   if (!hasPermission) return;
    //   await Geolocator.getCurrentPosition(
    //           desiredAccuracy: LocationAccuracy.high)
    //       .then((Position position) {
    //     setState(() => _currentPosition = position);
    //   }).catchError((e) {
    //     debugPrint(e);
    //   });
    // }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        const AppText(
          title: 'Lorem ipsum dolor sit amet, ',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          titleColor: Color(0xFF103566),
        ),
        const SizedBox(height: 14),
        const AppText(
          title:
              'Sapien tincidunt volutpat eu proin ut diam volutpat semper sem.',
          fontSize: 16,
          overflow: TextOverflow.visible,
          titleTextAlign: TextAlign.center,
          titleColor: Color(0xFF6F6F6F),
        ),
        const SizedBox(height: 30),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 26),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(5))),
          child: Column(
            children: [
              Container(
                width: 260,
                child: const AppText(
                  title: 'Lorem ipsum dolor sit amet,',
                  fontSize: 16,
                  overflow: TextOverflow.visible,
                  titleTextAlign: TextAlign.center,
                  titleColor: Color(0xFF141414),
                ),
              ),
              const SizedBox(height: 14),
              // widget.isLivelinessScreen == 99 && url1 != ''
              //     ? Image.file(
              //         File(url1),
              //         height: 120,
              //         width: 120,
              //       )
              //     :
              // widget.isLivelinessScreen == 99 && url1 == ''
              widget.isLivelinessScreen == 99
                  ? Container(
                      height: 150,
                      width: 150,
                      child: CameraPreview(widget.controller))
                  : Image.asset('assets/images/human_face.jpg'),
              const SizedBox(height: 20),
            ],
          ),
        ),
        const SizedBox(height: 18),
        InkWell(
          onTap: widget.isLivelinessScreen == 99
              ? widget.onTapCapture
              //  () async {
              //     final path = join((await getTemporaryDirectory()).path,
              //         '${DateTime.now()}.png');
              //     await widget.controller.takePicture().then((res) => {
              //           setState(() {
              //             url1 = path;
              //           })
              //         });

              //     // _getCurrentPosition();
              //   }
              : widget.onTap,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF01A2BB)),
            child: AppText(
              titleTextAlign: TextAlign.center,
              title: widget.isLivelinessScreen == 99
                  ? "Capture"
                  : 'Start Liveness',
              fontSize: 16,
              titleColor: Colors.white,
            ),
          ),
        ),
        const SizedBox(height: 20),
        widget.isLivelinessScreen == 99
            ? InkWell(
                onTap: widget.onTapCancel,
                // () {
                //   setState(() {
                //     url1 = '';
                //   });
                // },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 56),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: const Color(0xFF01A2BB))),
                  child: const AppText(
                    titleTextAlign: TextAlign.center,
                    title: 'Cancel',
                    fontSize: 14,
                    titleColor: const Color(0xFF01A2BB),
                  ),
                ),
              )
            : const AppText(
                title: 'View Instructions',
                fontSize: 14,
                titleColor: Color(0xFF0070E0),
              ),
      ]),
    );
  }
}
