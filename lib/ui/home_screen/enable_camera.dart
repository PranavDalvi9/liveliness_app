import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:liveliness_app/common/app_text.dart';

class EnableCamera extends StatefulWidget {
  final VoidCallback onTap;

  const EnableCamera({super.key, required this.onTap});

  @override
  State<EnableCamera> createState() => _EnableCameraState();
}

class _EnableCameraState extends State<EnableCamera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        const AppText(
          title: 'Allow Camera access',
          fontSize: 18,
          fontWeight: FontWeight.w600,
          titleColor: Color(0xFF103566),
        ),
        const SizedBox(height: 14),
        const AppText(
          title: 'Sapien tincidunt volutpat eu proin ut dia',
          fontSize: 16,
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
                  title:
                      'Tap allow on the popup that appears on the next screen',
                  fontSize: 16,
                  overflow: TextOverflow.visible,
                  titleTextAlign: TextAlign.center,
                  titleColor: Color(0xFF6F6F6F),
                ),
              ),
              const SizedBox(height: 14),
              SvgPicture.asset('assets/images/allow_banner.svg'),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const AppText(
          title: 'Why do I need to do this?',
          fontSize: 16,
          titleColor: Color(0xFF0070E0),
        ),
        const SizedBox(height: 18),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xFF01A2BB)),
            child: const AppText(
              titleTextAlign: TextAlign.center,
              title: 'Enable Camera',
              fontSize: 16,
              titleColor: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
