import 'package:flutter/material.dart';
import 'package:instagramui/theme/colors.dart';
import 'package:line_icons/line_icons.dart';

class Post extends StatefulWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final String likedBy;
  final String caption;
  final String commentCount;
  final String timeAgo;
  final bool isLoved;

  const Post({ Key key, 
  this.profileImg, 
  this.name, 
  this.postImg, 
  this.likedBy,
  this.caption,
  this.commentCount,
  this.timeAgo,
  this.isLoved,
   }) : super(key: key);

  @override
  _PostState createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isLoved;

  @override
  void initState() { 
    super.initState();
    isLoved = widget.isLoved;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(widget.profileImg), fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      widget.name,
                      style: TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Icon(LineIcons.verticalEllipsis, color: black,),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.postImg),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLoved = !isLoved;                       
                        });
                      },
                      icon: Container(
                        margin: EdgeInsets.only(right: 1),
                        width: 27,
                        height: 27,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              isLoved 
                              ? "assets/images/loved.png"
                              : "assets/images/love.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Image.asset("assets/images/comment.png", width: 27,),
                    SizedBox(width: 20,),
                    Image.asset("assets/images/message.png", width: 27,),
                  ],
                ),
                Image.asset("assets/images/save.png", width: 27,),
              ],
            ),
          ),
          SizedBox(height: 12,),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Curtido por ",
                    style: TextStyle(color: black, fontSize: 15),
                  ),
                  TextSpan(
                    text: "${widget.likedBy} ",
                    style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextSpan(
                    text: "e ",
                    style: TextStyle(color: black, fontSize: 15),
                  ),
                  TextSpan(
                    text: "outras pessoas ",
                    style: TextStyle(color: black, fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ]
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${widget.name} ",
                    style: TextStyle(
                      color: black,
                      fontSize: 15,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  TextSpan(
                    text: "${widget.caption} ",
                    style: TextStyle(
                      color: black,
                      fontSize: 15,
                    ),
                  ),
                ]
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "Ver ${widget.commentCount} comentários",
              style: TextStyle(
                color: black.withOpacity(0.5),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(widget.profileImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "Adicione um comentário...",
                      style: TextStyle(
                        color: black.withOpacity(0.5),
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "❤️",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(
                      "🤲🏼",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Icon(Icons.add_circle_outline, color: black.withOpacity(0.5), size: 14,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 5,),
          Padding(padding: const EdgeInsets.only(left: 15, right: 15),
            child: Text(
              "${widget.timeAgo}",
              style: TextStyle(
                color: black.withOpacity(0.5),
                fontSize: 12,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ],
      ),
    );
  }
}