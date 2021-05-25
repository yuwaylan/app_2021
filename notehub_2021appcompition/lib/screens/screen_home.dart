import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:notehub_2021appcompition/compents.dart';
import 'package:notehub_2021appcompition/vars.dart';

class categScreen extends StatefulWidget {  
  @override
  _categScreen createState() => _categScreen();
}

class _categScreen extends State<categScreen> {     
  final TextEditingController _controller = TextEditingController(); 
bool is_logedin = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              appBar: new AppBar(
                //toolbarHeight: is_search?55 :155,
                centerTitle: false,
                actions: <Widget>[

                  is_logedin
                      ? IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              is_logedin = !is_logedin;
                              print(is_logedin);
                            });
                            log('search sth~~~ ');
                          },
                        )
                      : IconButton(
                          icon: Icon(
                            Icons.cancel,
                            color: Color(0x00000000),
                          ),
                          onPressed: () {
                          },
                        ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                title: const Text('Hi '+'${'usrname'}'+'${'hello_datetime'}'),
                backgroundColor: Color(0xFF454545),
              ),
              backgroundColor: Color(0xFF121212),
              body: ListView(
                Card(
                  body: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(                                              
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
                  
                    ],
                ),
                  MyCardas(isHome),
                  
                )

              ),
            ),
          ),
        ));
  }
}