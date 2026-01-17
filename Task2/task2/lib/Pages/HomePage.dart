import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 20.0,
                        end: 2.0,
                      ),

                      child: Icon(FontAwesomeIcons.youtube, color: Colors.red),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 2.0,
                        end: 2.0,
                      ),

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
                ),
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
                      end: 10,
                      iconData: FontAwesomeIcons.magnifyingGlass,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarSubIconButton(iconData: FontAwesomeIcons.compass),
                Row(
                  children: [
                    NavBarTextButton(text: "Explore"),
                    SizedBox(width: 10.0),
                    NavBarTextButton(text: "Shorts"),
                    SizedBox(width: 10.0),
                    NavBarTextButton(text: "Subscriptions"),
                    SizedBox(width: 10.0),
                    NavBarTextButton(text: "Library"),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
