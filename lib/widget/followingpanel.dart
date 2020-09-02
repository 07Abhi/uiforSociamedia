import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';

class FollowerPanel extends StatefulWidget {
  FollowerPanel({Key key}) : super(key: key);

  @override
  _FollowerPanelState createState() => _FollowerPanelState();
}

class _FollowerPanelState extends State<FollowerPanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.0,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Following',
              style: TextStyle(
                fontFamily: 'Ubuntu',
                fontSize: 21.0,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              height: 60.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  User user = users[index];
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 32.0,
                        backgroundColor: Theme.of(context).accentColor,
                        child: CircleAvatar(
                          radius: 28.0,
                          backgroundImage: AssetImage(user.profileImageUrl),
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      )
                    ],
                  );
                },
                itemCount: users.length,
                shrinkWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
