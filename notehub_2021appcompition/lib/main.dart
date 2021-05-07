import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notehub_2021appcompition/screens/screen_catecories.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'vars.dart';
import 'modal-screen.dart';
import 'screens/screen_profile.dart';
import 'screens/screens.dart';

void main() => runApp(MyApp());
BuildContext testContext;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Persistent Bottom Navigation Bar example project',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: mainpage(),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // '/first': (context) => MainScreen2(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        // '/second': (context) => MainScreen3(),
      },
    );
  }
}


// ----------------------------------------- Provided Style ----------------------------------------- //

class mainpage extends StatefulWidget {
  final BuildContext menuScreenContext;
  mainpage({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _mainpageState createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  PersistentTabController _controller;


  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<Widget> _buildScreens() {
    return [
      //home
      MainScreen(
        menuScreenContext: widget.menuScreenContext,
        onScreenHideButtonPressed: () {
          setState(() {
          });
        },
      ),
      //your note
      MainScreen(
        menuScreenContext: widget.menuScreenContext,
        onScreenHideButtonPressed: () {
          setState(() {
          });
        },
      ),
      //add note
      MainScreen(
        menuScreenContext: widget.menuScreenContext,
        onScreenHideButtonPressed: () {
          setState(() {
          });
        },
      ),
      //categories
      categScreen(),
      //profile
      ProfileScreen(
        menuScreenContext: widget.menuScreenContext,
        onScreenHideButtonPressed: () {
          setState(() {
            vars.hidenavbar = !vars.hidenavbar;
            log("page creat");
          });
        },
      ),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: "Home",
        activeColorPrimary: Color(0xFF53B3CB),
        inactiveColorPrimary: Colors.grey,
        inactiveColorSecondary: Colors.purple,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.sticky_note_2_rounded),
        title: ("Your Note"),
        activeColorPrimary: Color(0xFF53B3CB),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            // '/first': (context) => MainScreen2(),
            // '/second': (context) => MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.add),
          title: ("Add"),
          activeColorPrimary: Color(0xFF53B3CB),
          activeColorSecondary: Colors.white,
          inactiveColorPrimary: Colors.white,
          routeAndNavigatorSettings: RouteAndNavigatorSettings(
            initialRoute: '/',
            routes: {
              // '/first': (context) => MainScreen2(),
              // '/second': (context) => MainScreen3(),
            },
          ),
          onPressed: (context) {
            pushDynamicScreen(context,
                screen: SampleModalScreen(), withNavBar: true);
          }),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.now_widgets_rounded),
        title: ("Categories"),
        activeColorPrimary: Color(0xFF53B3CB),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            // '/first': (context) => MainScreen2(),
            // '/second': (context) => MainScreen3(),
          },
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person_rounded),
        title: ("Profile"),
        activeColorPrimary: Color(0xFF53B3CB),
        inactiveColorPrimary: Colors.grey,
        routeAndNavigatorSettings: RouteAndNavigatorSettings(
          initialRoute: '/',
          routes: {
            // '/first': (context) => MainScreen2(),
            // '/second': (context) => MainScreen3(),
          },
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Color(0xFF454545),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        hideNavigationBar: vars.hidenavbar,
        margin: EdgeInsets.all(0.0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        onWillPop: (context) async {
          await showDialog(
            context: context,
            useSafeArea: true,
            builder: (context) => Container(
              height: 50.0,
              width: 50.0,
              color: Colors.white,
              child: ElevatedButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
          return false;
        },
        selectedTabScreenContext: (context) {
          testContext = context;
        },
        // hideNavigationBar: _hideNavBar,
        decoration: NavBarDecoration(
            colorBehindNavBar: Color.fromRGBO(255, 0, 0, 0),
            borderRadius: BorderRadius.circular(15.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style17, // Choose the nav bar style with this property
      ),
    );
  }
}

