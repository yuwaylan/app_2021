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
              body: MyCardas(),
              ),
            ),
          ),
        ));
  }
}


class Cards extends State<cardbuilder> {
  bool checkBoxValue = false;

  @override
  Widget build(BuildContext ctxt) {
    return StreamBuilder(
      stream: MyCard.instance.collection('baby').snapshots(),
      builder: (_, AsyncSnapshot<MC> snapshot) {
        var documents = snapshot.data?.documents ?? [];
        var baby =
        documents.map((snapshot) => BabyData.from(snapshot)).toList();
        return CardDesi(baby);
      },
    );
  }
}

class CardDesi extends StatefulWidget {
  final List<CardDesiState> allBaby;

  CardDesi(this.allBaby);

  @override
  State<StatefulWidget> createState() {
    return CardDesiState();
  }
}


class CardDesiState extends State<CardDesi> {
  @override
  Widget build(BuildContext context) {

    //  var filteredBaby = widget.allFish.where((BabyData data) {
    //    data.name = 'Dana';
    //  }).toList();

  return MaterialApp(
      home: SafeArea(
          child: Scaffold(
            body: Container(
                child: ListView.builder(
                    itemCount: widget.allBaby.length,
                    padding: const EdgeInsets.only(top: 10.0),
                    itemBuilder: (context, index) {
                      return CardDesiState(widget.allBaby[index]);
                    })
            ),
          )
        )
      );
  }
}
