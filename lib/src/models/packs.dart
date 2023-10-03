import 'package:flutter/material.dart';

class Pack {
  String title;
  String subTitle;
  bool isNew;
  String backgroundImage;
  bool isTrial;
  Widget? headerIcons;

  Pack({
    required this.title,
    required this.isNew,
    required this.subTitle,
    required this.backgroundImage,
    this.headerIcons,
    required this.isTrial,
  });
}
