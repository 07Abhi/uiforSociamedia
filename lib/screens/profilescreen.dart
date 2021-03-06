import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widget/customdrawer.dart';
import 'package:flutter_social_ui/widget/followfollowingpanel.dart';
import 'package:flutter_social_ui/widget/pagecarousel.dart';
import 'package:flutter_social_ui/widget/profileclipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PageController _pageControllerpost;
  PageController _pageControllerFav;
  final _scaffKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _pageControllerpost = PageController(initialPage: 0, viewportFraction: 0.6);
    _pageControllerFav = PageController(initialPage: 0, viewportFraction: 0.6);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffKey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300.0,
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 20.0,
                  left: 10.0,
                  child: IconButton(
                    onPressed: () {
                      _scaffKey.currentState.openDrawer();
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(widget.user.profileImageUrl),
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.0),
            Text(
              widget.user.name,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w700,
                color: Colors.grey.shade800,
              ),
            ),
            FollowFollowingPanel(
                followers: widget.user.followers,
                following: widget.user.following),
            PageCarousel(
              pageController: _pageControllerpost,
              title: 'Posts',
              posts: widget.user.posts,
            ),
            SizedBox(
              height: 10.0,
            ),
            PageCarousel(
              pageController: _pageControllerFav,
              title: 'Favorites',
              posts: widget.user.favorites,
            )
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
