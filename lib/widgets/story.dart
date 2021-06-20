import 'package:flutter/material.dart';
import 'package:instagramui/json/story_json.dart';
import 'package:instagramui/theme/colors.dart';

class Story extends StatelessWidget {
  final String img;
  final String name;

  const Story({ Key key, this.img, this.name }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(right: 20, bottom: 5,),
                    child: Column(
                      children: [
                        Container(
                          width: 68,
                          height: 68,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: storyBorderColor,
                            ),
                          ),
                          child: Padding(padding: const EdgeInsets.all(3),
                            child: Container(
                              width: 65,
                              height: 65,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: white,
                                  width: 4,
                                ),
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(img),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8,),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              color: black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
  }
}