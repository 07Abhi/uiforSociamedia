import 'package:flutter/material.dart';

class FollowFollowingPanel extends StatelessWidget {
  final int followers;
  final int following;
  const FollowFollowingPanel({this.followers, this.following});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Followers',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).accentColor.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                followers.toString(),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Following',
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).accentColor.withOpacity(0.8),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                following.toString(),
                style: TextStyle(
                  fontFamily: 'Ubuntu',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
