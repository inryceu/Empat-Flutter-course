import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui.dart';

Widget YouTubeLogo() => Row(
  children: [
    Padding(
      padding: EdgeInsetsGeometry.directional(start: 20.0, end: 2.0),
      child: Icon(FontAwesomeIcons.youtube, color: Colors.red),
    ),
    Padding(
      padding: EdgeInsetsGeometry.directional(start: 2.0, end: 20.0),
      child: Text(
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

List<Widget> navBarTextButtons = [
  NavBarSubIconButton(iconData: FontAwesomeIcons.compass),

  NavBarTextButton(text: "All"),
  NavBarTextButton(text: "Podcasts"),
  NavBarTextButton(text: "Gaming"),
  NavBarTextButton(text: "Music"),
  NavBarTextButton(text: "Explore"),
  NavBarTextButton(text: "Streaming"),
  NavBarTextButton(text: "Mixes"),
  NavBarTextButton(text: "Already Watched"),
  NavBarTextButton(text: "Lastly Uploaded"),
];

AppBar MyAppBar() => AppBar(
  toolbarHeight: 80.0,
  flexibleSpace: Column(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      SizedBox(height: 20.0),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          YouTubeLogo(),
          Row(
            children: [
              NavBarMainIconButton(
                start: 10,
                end: 10,
                iconData: FontAwesomeIcons.chromecast,
              ),

              NavBarMainIconButton(
                start: 10,
                end: 10,
                iconData: FontAwesomeIcons.bell,
              ),

              NavBarMainIconButton(
                start: 10,
                end: 20,
                iconData: FontAwesomeIcons.magnifyingGlass,
              ),
            ],
          ),
        ],
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [Row(children: navBarTextButtons)],
        ),
      ),
    ],
  ),
);

Widget MyBody() => Column(
  children: [
    Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image(image: AssetImage('covers/1.jpg')),
          SizedBox(height: 5.0),
          Row(
            children: [
              CircleAvatar(backgroundImage: AssetImage('avatars/1.jpg')),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sample Video Title',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Channel Name • 1M views • 1 day ago',
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
);
