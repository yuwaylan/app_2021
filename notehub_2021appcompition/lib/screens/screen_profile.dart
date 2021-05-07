import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:notehub_2021appcompition/edit/edit_prof.dart';

class ProfileScreen extends StatelessWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;

  const ProfileScreen({
    Key key,
    this.menuScreenContext,
    this.onScreenHideButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Scaffold(
          appBar: new AppBar(
            centerTitle: false,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                onPressed: () {
                  // setState(() {
                  //   vars.hidenavbar = true;
                  //   log("page creat");
                  // });
                  log('pressed ');
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context) => edit_prof()));
                },
              )
            ],

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
            title: const Text('Profile'),
            backgroundColor: Color(0xFF454545),
          ),
          backgroundColor: Color(0xFF121212),
          body: Column(children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/180720030_4523150361045545_7435303611753071707_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=825194&_nc_ohc=hYdMBq9_T3UAX8PwJZy&_nc_ht=scontent-hkt1-2.xx&oh=28eee9ad2515aa1167403ae081be7b97&oe=60BA2C24'),
                                    fit: BoxFit.cover))),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "hello",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              ),
                            ),
                            Text("I AM CAT",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 130,
                        ),
                      ]),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("0",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              )),
                          Text("Post",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Column(
                        children: [
                          Text("0",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 18,
                              )),
                          Text("Likes",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text("0",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("\u{1F393}" + "          "+"123",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("\u{1F4DA}" + "          "+"123",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text("\u{1F4BC}" + "          "+"123",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      )),

                  SizedBox(
                    height: 28,
                  ),

                ],
              ),
            ),

          ]),
        ),
      ),
    );
  }
}
