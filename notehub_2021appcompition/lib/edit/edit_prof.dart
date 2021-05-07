import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:direct_select/direct_select.dart';


import 'package:notehub_2021appcompition/vars.dart';

class edit_prof extends StatefulWidget {
  final BuildContext menuScreenContext;
  final Function onScreenHideButtonPressed;

  edit_prof({
    Key key,
    this.menuScreenContext,
    this.onScreenHideButtonPressed,
  }) : super(key: key);

  @override
  _edit_prof createState() => _edit_prof();
}

class _edit_prof extends State<edit_prof> {
  int dept_index =5;
  File _image = null;
  var imgpath =
      'https://scontent-hkt1-2.xx.fbcdn.net/v/t1.6435-9/180720030_4523150361045545_7435303611753071707_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=825194&_nc_ohc=hYdMBq9_T3UAX8PwJZy&_nc_ht=scontent-hkt1-2.xx&oh=28eee9ad2515aa1167403ae081be7b97&oe=60BA2C24';
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        imgpath = _image.path;
      } else {
        print('No image selected.');
      }
    });
  }


  List<Widget> _buildItems() {
    return vars.department
        .map((val) => MySelectionItem(
      title: val,
    ))
        .toList();
  }

  Widget _entryField(String title, String hint,{bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 15,
                color: Colors.white
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            obscureText: isPassword,
            cursorColor: Color(0xFFFFFFFF),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              filled: true,
              fillColor: Color(0xFF454545),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(25.0),
              ),
              // labelText: "Full Name",
              hintStyle: TextStyle(color: Color(0x5FFFFFFF)),
              hintText: hint,
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

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
              backgroundColor: Color(0xFF121212),
              body: ListView(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: _image != null
                                  ? new FileImage(_image)
                                  : NetworkImage(imgpath),
                              fit: BoxFit.cover))),
                  TextButton(
                      onPressed: () {
                        getImage();
                      },
                      child: Text("Change photo")
                  ),

                  _entryField('Name *','Da-Ming,Wang'),
                  _entryField('Email *','yzu@email.com'),
                  Padding(
                    padding: EdgeInsets.only(left: 30),
                    child:Text(
                    "Your depatrment *",
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.white
                    ),
                  ),),
                  SizedBox(
                    height: 10,
                  ),
                  DirectSelect(
                      itemExtent: 50,
                      selectedIndex: dept_index,
                      backgroundColor: Color(0xFF121212),
                      child: MySelectionItem(

                        isForList: false,
                        title: vars.department[dept_index],

                      ),
                      onSelectedItemChanged: (index) {
                        setState(() {
                          dept_index = index;
                          log(vars.department[dept_index]);
                        });
                      },
                      items: _buildItems()),
                  SizedBox(
                    height: 30,
                  ),
                  _entryField('Data of Birth', '19980413'),
                  _entryField('Tell me something about you !','I love drawing picture and coding.'),
                  _entryField('University','Yuan Ze University'),
                  _entryField('Intership','Write your company'),

                  /*------------------------*/
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        log('Save');
                        log(_image.path);
                      },
                      child: Text(
                        "Save  Changes",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


class MySelectionItem extends StatelessWidget {
  final String title;
  final bool isForList;
  final Color c;

  const MySelectionItem({Key key, this.title, this.isForList = true,this.c})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0,
      child: isForList
          ? Padding(
        child: _buildItem(context),
        padding: EdgeInsets.all(10.0),
      )
          : Card(
        color: Color(0xFF454545),
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child: Stack(
          children: <Widget>[
            _buildItem(context),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(Icons.arrow_drop_down),
            )
          ],
        ),
      ),
    );
  }

  _buildItem(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: Text(title,style: TextStyle(color: Colors.white60),),
    );
  }
}
