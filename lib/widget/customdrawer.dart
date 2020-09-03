import 'package:flutter_social_ui/screens/homescreen.dart';
import 'package:flutter_social_ui/screens/profilescreen.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/screens/loginscreen.dart';

class CustomDrawer extends StatelessWidget {
  _pageRouteLoginScreen(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInOutCirc;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  _pageRouteProfileScreen(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(
        user: currentUser,
      ),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeInCubic;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  _pageRouteHomeScreen(BuildContext context) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => HomeScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeOutCubic;
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  _drawerMenuTiles(IconData icon, String text, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          size: 30.0,
          color: Color(0xfffc3468).withOpacity(0.6),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontFamily: 'Ubuntu',
            color: Colors.grey.shade700,
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          drawerHeader(context),
          SizedBox(
            height: 7.0,
          ),
          _drawerMenuTiles(
            Icons.home_filled,
            'Home',
            () => Navigator.pushReplacement(
              context,
              _pageRouteHomeScreen(context),
            ),
          ),
          _drawerMenuTiles(
            Icons.forum,
            'Chats',
            () {},
          ),
          _drawerMenuTiles(
            Icons.location_on_outlined,
            'Maps',
            () {},
          ),
          _drawerMenuTiles(
            Icons.person_outline_outlined,
            'Profile',
            () => Navigator.pushReplacement(
              context,
              _pageRouteProfileScreen(context),
            ),
          ),
          _drawerMenuTiles(
            Icons.settings,
            'Settings',
            () {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _drawerMenuTiles(
                Icons.directions_run,
                "Logout",
                () => Navigator.pushReplacement(
                  context,
                  _pageRouteLoginScreen(context),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget drawerHeader(BuildContext context) {
  return Container(
    height: 250.0,
    child: Stack(
      children: [
        Image(
          image: AssetImage('assets/images/drawerimage.jpg'),
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 10.0,
          bottom: 20.0,
          child: CircleAvatar(
            radius: 55.0,
            backgroundColor: Theme.of(context).accentColor,
            child: CircleAvatar(
              radius: 52.0,
              backgroundImage: AssetImage(currentUser.profileImageUrl),
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          right: 15.0,
          child: Text(
            "Hi, " + currentUser.name,
            style: TextStyle(
              fontFamily: "Ubuntu",
              color: Colors.grey.shade800,
              fontWeight: FontWeight.w600,
              fontSize: 26.0,
            ),
          ),
        )
      ],
    ),
  );
}
