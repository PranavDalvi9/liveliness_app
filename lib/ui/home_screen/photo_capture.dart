import 'package:flutter/material.dart';
import 'package:liveliness_app/common/app_text.dart';

class PhotoCapture extends StatefulWidget {
  const PhotoCapture({super.key});

  @override
  State<PhotoCapture> createState() => _PhotoCaptureState();
}

class _PhotoCaptureState extends State<PhotoCapture> {
  @override
  Widget build(BuildContext context) {
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
              border: Border.all(color: Colors.black12),
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
              Image.asset('assets/images/human_face.jpg'),
              const SizedBox(height: 24),
              const AppText(
                titleTextAlign: TextAlign.center,
                title: 'GPS 73.81.953',
                fontSize: 14,
                titleColor: const Color(0xFF01A2BB),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        const AppText(
          titleTextAlign: TextAlign.center,
          title: 'Change Picture',
          isUnderline: true,
          fontSize: 14,
          titleColor: const Color(0xFF01A2BB),
        ),
      ]),
    );
  }
}
