import 'package:flutter/material.dart';
import 'package:liveliness_app/common/app_text.dart';

class LiveTestPassed extends StatefulWidget {
  const LiveTestPassed({super.key});

  @override
  State<LiveTestPassed> createState() => _LiveTestPassedState();
}

class _LiveTestPassedState extends State<LiveTestPassed> {
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
              Image.asset('assets/images/human_face.jpg'),
              const SizedBox(height: 24),
              RichText(
                text: TextSpan(
                  text: 'Liveness Test ',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  children: const <TextSpan>[
                    TextSpan(
                        text: 'Pass', style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFF01A2BB)),
          child: const AppText(
            titleTextAlign: TextAlign.center,
            title: 'Capture',
            fontSize: 14,
            titleColor: Colors.white,
          ),
        ),
        const SizedBox(height: 24),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 56),
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
      ]),
    );
  }
}
