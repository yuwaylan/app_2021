import 'package:flutter/material.dart';
import 'dart:developer';

class categScreen extends StatefulWidget {   // 把MyHomePage設為一個StatefulWidget
  @override
  _categScreen createState() => _categScreen();
}

class _categScreen extends State<categScreen> {      // 定義一個私有的Class，繼承自ＭyHomePage
  final TextEditingController _controller = TextEditingController();  // 定義一個controler
bool is_search = true;
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

                  is_search
                      ? IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              is_search = !is_search;
                              print(is_search);
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
                            // setState(() {
                            //   is_search = !is_search;
                            //   print(is_search);
                            // });
                            // log('No search sth~~~ ');
                          },
                        ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(10),
                  ),
                ),
                title: const Text('Categories'),
                backgroundColor: Color(0xFF454545),
              ),
              backgroundColor: Color(0xFF121212),
              body: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Card(

                  )

                ],
              ),
            ),
          ),
        ));
  }
}
