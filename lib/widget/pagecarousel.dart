import 'package:flutter_social_ui/models/post_model.dart';
import 'package:flutter/material.dart';

class PageCarousel extends StatefulWidget {
  final PageController pageController;
  final String title;
  final List<Post> posts;
  PageCarousel({this.pageController, this.title, this.posts});

  @override
  _PageCarouselState createState() => _PageCarouselState();
}

class _PageCarouselState extends State<PageCarousel> {
  _postBuilder(BuildContext context, int index) {
    Post post = widget.posts[index];
    return AnimatedBuilder(
      animation: widget.pageController,
      builder: (BuildContext context, Widget widget1) {
        double value = 1;
        /*value here define the depth of the unfocused post*/
        if (widget.pageController.position.haveDimensions) {
          value = widget.pageController.page - index;
          value = (1 - (value.abs() * 0.30)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
              height: Curves.easeInOut.transform(value) * 400, child: widget1),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, -1.0),
                  blurRadius: 6.0,
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                height: 400.0,
                width: 300.0,
                image: AssetImage(post.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            right: 0.0,
            left: 0.0,
            bottom: 0.0,
            child: Container(
              height: 110.0,
              margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0)),
                color: Colors.white60,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      post.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18.0,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      post.location,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Ubuntu',
                          fontWeight: FontWeight.w700),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Theme.of(context).primaryColor,
                              size: 30.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              post.likes.toString(),
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.message,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              post.comments.toString(),
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontSize: 22.0,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          height: 400,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            itemBuilder: (context, index) {
              return _postBuilder(context, index);
            },
            controller: widget.pageController,
            itemCount: widget.posts.length,
          ),
        )
      ],
    );
  }
}
