import 'package:flutter/material.dart';
import 'package:instagramui/screens/home_screen.dart';
import 'package:instagramui/screens/search_screen.dart';
import 'package:instagramui/theme/colors.dart';

class RootApp extends StatefulWidget {
  const RootApp({ Key key }) : super(key: key);

  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int screenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(),
      backgroundColor: white,
      bottomNavigationBar: getBottomNavigationBar(),
    );
  }

  Widget getAppBar() {
    if(screenIndex == 0) {
      return AppBar(
        backgroundColor: white,
        shadowColor: Colors.grey.withOpacity(0.2),
        title: Text(
          "Instagram",
          style: TextStyle(
            fontFamily: 'Billabong',
            color: black,
            fontSize: 35,
          ),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/upload.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/love.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: null,
            icon: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/chat.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return null;
    }
    
  }

  Widget getBottomNavigationBar() {
    List bottomItems = [
      screenIndex == 0
      ? "assets/images/home_active.png"
      : "assets/images/home.png",
      screenIndex == 1
      ? "assets/images/search_active.png"
      : "assets/images/search.png",
      screenIndex == 2
      ? "assets/images/reels_black.png"
      : "assets/images/reels.png",
      screenIndex == 3
      ? "assets/images/shop_active.png"
      : "assets/images/shop.png",
      "assets/images/perfil_1.jpg",
    ];
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(color: white),
      child: Padding(
        padding: const EdgeInsets.only(left:20, right: 20,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(bottomItems.length, (index) {
            return InkWell(
              onTap: () {
                selectedScreen(index);
              },
              child: index != 4 ? Image.asset(bottomItems[index], width: 26,)
                : Container(
                  width: screenIndex != 4 ? 26 : 27,
                  height: screenIndex != 4 ? 26 : 27,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: black,
                      width: screenIndex != 4 ? 0 : 1.5,
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(bottomItems[index]), fit: BoxFit.cover),
                  ),
                ),
            );
          }),
        ),
      ),
    );
  }

  Widget getBody() {
    List<Widget> screens = [
      HomeScreen(),
      SearchScreen(),
      Center(child: Text("Reels", style: TextStyle(fontSize: 20, color: black),),),
      Center(child: Text("Shop", style: TextStyle(fontSize: 20, color: black),),),
      Center(child: Text("Profile", style: TextStyle(fontSize: 20, color: black),),),
    ];
    return IndexedStack(
      index: screenIndex,
      children: screens,
    );
  }

  selectedScreen(index) {
    setState(() {
          screenIndex = index;
        });
  }
}