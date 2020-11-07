import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  String aljon = 'Aljon Mutalib';
  String nagdar = 'Nagdar Mutalib';
  String tina = 'Tina Mutalib';
  String sherhan = 'Sherhan Mutalib';
  String liezel = 'Liezel Mutalib';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget> [
          DrawerHeader(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: Colors.red
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Row(
                    children: <Widget>[
                      Text(
                        'My Drawer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ]
                  )
                ),
              ],
            )
          ),
          GestureDetector(
            onTap: () async {
                final snackBar = SnackBar(
                  duration: const Duration(
                    milliseconds: 1000
                  ),
                  content: Row(
                    children: <Widget>[
                      Text(aljon),
                    ],
                  )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(aljon,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 18,
                  ),
                  
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
                final snackBar = SnackBar(
                  duration: const Duration(
                    milliseconds: 1000
                  ),
                  content: Row(
                    children: <Widget>[
                      Text(nagdar),
                    ],
                  )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(nagdar,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 18,
                  ),
                  
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
                final snackBar = SnackBar(
                  duration: const Duration(
                    milliseconds: 1000
                  ),
                  content: Row(
                    children: <Widget>[
                      Text(tina),
                    ],
                  )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(tina,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 18,
                  ),
                  
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
                final snackBar = SnackBar(
                  duration: const Duration(
                    milliseconds: 1000
                  ),
                  content: Row(
                    children: <Widget>[
                      Text(sherhan),
                    ],
                  )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(sherhan,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 18,
                  ),
                  
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
                final snackBar = SnackBar(
                  duration: const Duration(
                    milliseconds: 1000
                  ),
                  content: Row(
                    children: <Widget>[
                      Text(liezel),
                    ],
                  )
                );
                Scaffold.of(context).showSnackBar(snackBar);
              },
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(liezel,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.red,
                    size: 18,
                  ),
                  
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}