import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'styles.dart';

Widget NavBarMainIconButton({
  required double start,
  required double end,
  required IconData iconData,
}) => Padding(
  padding: EdgeInsetsGeometry.directional(start: start, end: end),
  child: Icon(iconData, color: Colors.white),
);

Widget NavBarSubIconButton({required IconData iconData}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: NavBarStyleWidget(
    child: IconButton(
      style: NavBarButtonStyle(),
      icon: Icon(
        iconData,
        color: Colors.white,
        fontWeight: FontWeight.w300,
        size: 24.0,
      ),
      onPressed: () {},
    ),
  ),
);

Widget NavBarTextButton({required String text}) => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 5.0),
  child: NavBarStyleWidget(
    child: TextButton(
      style: NavBarButtonStyle(),
      onPressed: () {},
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      ),
    ),
  ),
);

Widget NavBarBottomIconButton({
  required double start,
  required double end,
  required IconData iconData,
  required String text,
}) => Column(
  children: [
    NavBarMainIconButton(start: start, end: end, iconData: iconData),
    const SizedBox(height: 0.5),
    Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      ),
    ),
  ],
);

Widget Post({
  required String coverImagePath,
  required String avatarImagePath,
  required String title,
  required String videoInfo,
}) => Padding(
  padding: const EdgeInsets.all(10.0),
  child: Column(
    children: [
      Image(image: AssetImage(coverImagePath)),
      const SizedBox(height: 5.0),
      Row(
        children: [
          CircleAvatar(backgroundImage: AssetImage(avatarImagePath)),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                videoInfo,
                style: const TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
        ],
      ),
    ],
  ),
);

Widget ProfileButton({required String avatarImagePath}) => Column(
  children: [
    CircleAvatar(backgroundImage: AssetImage(avatarImagePath), radius: 12.0),
    const SizedBox(height: 0.5),
    Text(
      "You",
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 12.0,
      ),
    ),
  ],
);

Widget YouTubeLogo() => Row(
  children: [
    Padding(
      padding: const EdgeInsetsGeometry.directional(start: 20.0, end: 2.0),
      child: const Icon(FontAwesomeIcons.youtube, color: Colors.red),
    ),
    Padding(
      padding: const EdgeInsetsGeometry.directional(start: 2.0, end: 20.0),
      child: const Text(
        "YouTube",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          fontFamily: "YouTubeSans",
        ),
      ),
    ),
  ],
);
