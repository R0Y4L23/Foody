// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, no_logic_in_create_state, sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:google_fonts/google_fonts.dart";
import "./Components/restaurantItemCard.dart";

class Restaurant extends StatefulWidget {
  Restaurant({
    Key? key,
  }) : super(key: key);

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  @override
  Widget build(BuildContext context) {
    double dWidth = MediaQuery.of(context).size.width;
    double dHeight = MediaQuery.of(context).size.height;

    adjustedWidth(double width) {
      return width * dWidth / 375;
    }

    adjustedHeight(double height) {
      return height * dHeight / 667;
    }

    adjustedSize(double size) {
      return (((size * dWidth) / 375) + ((size * dHeight) / 667)) / 2;
    }

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.grey.shade50,
          title: Text(
            'RESTAURANT',
            style: GoogleFonts.raleway(
              textStyle: TextStyle(
                fontSize: adjustedSize(12),
                fontWeight: FontWeight.w600,
                color: Colors.black,
                letterSpacing: 1.5,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: adjustedHeight(200),
                width: adjustedWidth(375),
                decoration: BoxDecoration(
                    color: args["color"],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(adjustedSize(20)),
                        bottomRight: Radius.circular(adjustedSize(20)))),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image(
                        image: AssetImage(args["image"]),
                        height: adjustedHeight(140),
                      ),
                    ),
                    Positioned(
                        top: adjustedHeight(10),
                        right: adjustedWidth(20),
                        child: Container(
                          height: adjustedHeight(40),
                          width: adjustedHeight(40),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.circular(adjustedHeight(20))),
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              )),
                        )),
                    Positioned(
                      top: adjustedHeight(10),
                      left: adjustedWidth(20),
                      child: Container(
                          width: adjustedHeight(150),
                          height: adjustedHeight(180),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("OPEN (10:00 AM - 11:00 PM)",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      fontSize: adjustedSize(12),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.green,
                                      letterSpacing: 1.5,
                                    ),
                                  )),
                              SizedBox(height: adjustedHeight(5)),
                              Text("CLOSED (Thu - Sat)",
                                  style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                      fontSize: adjustedSize(12),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red,
                                      letterSpacing: 1.5,
                                    ),
                                  )),
                              SizedBox(height: adjustedHeight(5)),
                              Text(
                                args["name"],
                                style: TextStyle(
                                    fontSize: adjustedSize(35),
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: adjustedHeight(5)),
                              Text(
                                args["description"],
                                style: GoogleFonts.dancingScript(
                                    textStyle: TextStyle(
                                        fontSize: adjustedSize(20),
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(height: adjustedHeight(15)),
              Text("Popular Items",
                  style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                      fontSize: adjustedSize(20),
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 1.5,
                    ),
                  )),
              SizedBox(height: adjustedHeight(20)),
              RestaurantItemCard(),
              RestaurantItemCard(),
              RestaurantItemCard(),
              RestaurantItemCard(),
            ],
          ),
        )));
  }
}
