import 'package:flutter/material.dart';
import 'package:flutter_social_ui/widget/followingpanel.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          'FOODFILES',
          style: TextStyle(
            fontSize: 20.0,
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.w700,
            letterSpacing: 3.0,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).accentColor,
          labelStyle: TextStyle(
            fontFamily: 'Ubuntu',
            fontSize: 16.0,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.0,
          ),
          tabs: [
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'New In Town',
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          FollowerPanel(),
        ],
      ),
    );
  }
}
