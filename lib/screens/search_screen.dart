import 'package:flutter/material.dart';
import 'package:instagramui/json/search_json.dart';
import 'package:instagramui/theme/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key key }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
              child: Container(
                height: 40,
                width: size.width - 30,
                decoration: BoxDecoration(
                  color: textFieldBackground,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Pesquisar",
                    prefixIcon: Icon(
                      Icons.search,
                      color: black,
                    ),
                  ),
                  style: TextStyle(color: black),
                  cursorColor: black.withOpacity(0.3),
                ),
              ),
            ),
          ),
          Wrap(
            spacing: 1,
            runSpacing: 1,
            children: List.generate(searchImages.length, (index) {
              return Container(
                width: (size.width - 3) / 3,
                height: (size.width - 3) / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(searchImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}