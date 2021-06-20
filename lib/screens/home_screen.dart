import 'package:flutter/material.dart';
import 'package:instagramui/json/post_json.dart';
import 'package:instagramui/json/profile_json.dart';
import 'package:instagramui/json/story_json.dart';
import 'package:instagramui/theme/colors.dart';
import 'package:instagramui/widgets/post.dart';
import 'package:instagramui/widgets/story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.only(top: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(padding: const EdgeInsets.only(right: 20, left: 15, bottom: 5),
                    child: Column(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          child: Stack(
                            children: [
                              Container(
                                width: 68,
                                height: 68,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(profile), 
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: white),
                                  child: Icon(Icons.add_circle, color: buttonFollowColor, size: 19,),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        SizedBox(
                          width: 70,
                          child: Text(name, overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 12, color: black,),
                        ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(stories.length, (index) {
                      return Story(
                        img: stories[index]['img'],
                        name: stories[index]['name'],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          Divider(color: black.withOpacity(0.3),),
          Column(
            children: List.generate(posts.length, (index) {
              return Post(
                profileImg: posts[index]['profileImg'],
                name: posts[index]['name'],
                postImg: posts[index]['postImg'],
                likedBy: posts[index]['likedBy'],
                caption: posts[index]['caption'],
                commentCount: posts[index]['commentCount'],
                timeAgo: posts[index]['timeAgo'],
                isLoved: posts[index]['isLoved'],
              );
            }),
          ),
        ],
      ),
    );
  }
}