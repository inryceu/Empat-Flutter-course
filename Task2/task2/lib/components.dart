import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui.dart';

List<Widget> navBarMainButtons = [
  YouTubeLogo(),
  Row(
    children: [
      NavBarMainIconButton(
        start: 10,
        end: 10,
        iconData: FontAwesomeIcons.chromecast,
      ),

      NavBarMainIconButton(start: 10, end: 10, iconData: FontAwesomeIcons.bell),

      NavBarMainIconButton(
        start: 10,
        end: 20,
        iconData: FontAwesomeIcons.magnifyingGlass,
      ),
    ],
  ),
];

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

List<Widget> posts = [
  Post(
    coverImagePath: "covers/1.jpg",
    avatarImagePath: "avatars/1.jpg",
    title: "Flutter Tutorial for Beginners",
    videoInfo: "Flutter Dev • 1M views • 1 week ago",
  ),
  Post(
    coverImagePath: "covers/2.jpg",
    avatarImagePath: "avatars/2.jpg",
    title: "Dart Programming Language Overview",
    videoInfo: "Code Academy • 500K views • 2 weeks ago",
  ),
  Post(
    coverImagePath: "covers/3.jpg",
    avatarImagePath: "avatars/3.jpg",
    title: "Building Responsive UIs in Flutter",
    videoInfo: "Tech World • 750K views • 3 days ago",
  ),
  Post(
    coverImagePath: "covers/4.jpg",
    avatarImagePath: "avatars/2.jpg",
    title: "State Management in Flutter",
    videoInfo: "Flutter Experts • 300K views • 5 days ago",
  ),
  Post(
    coverImagePath: "covers/5.jpg",
    avatarImagePath: "avatars/1.jpg",
    title: "Animations in Flutter",
    videoInfo: "UI Masters • 450K views • 1 month ago",
  ),
];

List<Widget> bottomNavBarItems = [
  NavBarBottomIconButton(
    start: 0,
    end: 0,
    iconData: FontAwesomeIcons.house,
    text: "Home",
  ),
  NavBarBottomIconButton(
    start: 0,
    end: 0,
    iconData: FontAwesomeIcons.fireFlameCurved,
    text: "YouTube Shorts",
  ),
  Column(
    children: [
      Expanded(
        child: Icon(
          FontAwesomeIcons.circlePlus,
          color: Colors.white,
          size: 40.0,
        ),
      ),
    ],
  ),
  NavBarBottomIconButton(
    start: 0,
    end: 0,
    iconData: FontAwesomeIcons.folderPlus,
    text: "Subscriptions",
  ),
  ProfileButton(avatarImagePath: "avatars/1.jpg"),
];

AppBar MyAppBar() => AppBar(
  toolbarHeight: 80.0,
  flexibleSpace: SafeArea(
    top: true,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navBarMainButtons,
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
  ),
);

Widget MyBody() => SingleChildScrollView(child: Column(children: posts));

BottomAppBar MyBottomAppBar() => BottomAppBar(
  height: 80.0,
  color: Colors.black,
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: bottomNavBarItems,
    ),
  ),
);
