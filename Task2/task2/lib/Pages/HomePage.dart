import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 2.0,
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
                          fontWeight: FontWeight.bold,
                          fontFamily: "YouTubeSans",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 10.0,
                        end: 10.0,
                      ),

                      child: Icon(
                        FontAwesomeIcons.chromecast,
                        color: Colors.white,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 10.0,
                        end: 10.0,
                      ),

                      child: Icon(Icons.notifications, color: Colors.white),
                    ),

                    Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 10.0,
                        end: 10.0,
                      ),

                      child: Icon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[800],
                    shape: BoxShape.rectangle,
                  ),
                  child: IconButton(
                    style: IconButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      minimumSize: Size.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    icon: Icon(
                      FontAwesomeIcons.compass,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      size: 24.0,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
