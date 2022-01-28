// ignore_for_file: prefer_const_constructors_in_immutables, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_field, unused_local_variable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "./Components/smallCard.dart";
import "./Components/largeCard.dart";
import '/Components/topCard.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Map> _topList = [
    {
      'title': 'Pizza',
      'image': 'https://www.freeiconspng.com/uploads/pizza-png-1.png',
      'subtitle':
          'Pizza is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough.',
    },
    {
      'title': 'Burger',
      'image':
          'https://www.freeiconspng.com/uploads/hamburger-burger-png-image-12.png',
      'subtitle':
          'A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.',
    },
    {
      'title': 'Noodles',
      'image':
          'https://www.freeiconspng.com/uploads/recipe-noodles-icons-10.png',
      'subtitle':
          'Noodles is a type of food made from unleavened dough which has been stretched and formed into long, flat, cylindrical or layered sheets.',
    },
    {
      'title': 'Chicken',
      'image': 'https://www.freeiconspng.com/uploads/italian-food-16.png',
      'subtitle':
          'Chicken is a type of meat, which is the primary source of meat in many cuisines of the world.',
    },
  ];

  final List<Color> _topListColor = [
    Colors.red,
    Colors.green,
    Colors.orange,
    Colors.purple,
  ];

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

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          title: Text(
            'Foody',
            style: GoogleFonts.sedgwickAve(
              textStyle: TextStyle(
                fontSize: adjustedSize(25),
                fontWeight: FontWeight.w600,
                color: Colors.black,
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
          child: Container(
            padding: EdgeInsets.only(
                left: adjustedWidth(18),
                right: adjustedWidth(18),
                top: adjustedHeight(20)),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: adjustedHeight(115),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _topList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TopCard(
                        cardTitle: _topList[index]['title'],
                        cardImage: _topList[index]['image'],
                        cardSubtitle: _topList[index]['subtitle'],
                        cardColor: _topListColor[index],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: adjustedHeight(20),
                ),
                Text(
                  'Popular Restaurants',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      fontSize: adjustedSize(20),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: adjustedHeight(35),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallCard(
                          image: "assets/burger.png",
                          cardColor: Colors.green.shade100,
                          name: "Joes's Burger",
                          description: "Good Quality Burgers",
                        ),
                        SizedBox(
                          height: adjustedHeight(20),
                        ),
                        SmallCard(
                          image: "assets/pizza.png",
                          cardColor: Colors.orange.shade100,
                          name: "Sammy's Pizza",
                          description: "Best Pizzas",
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        SmallCard(
                          image: "assets/sushi.png",
                          cardColor: Colors.yellow.shade100,
                          name: "Sushi Time",
                          description: "Taste the best",
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        SmallCard(
                          image: "assets/salad.png",
                          cardColor: Colors.purple.shade100,
                          name: "Salad Place",
                          description: "Eat Tasty Salads",
                        ),
                        SizedBox(height: adjustedHeight(20)),
                      ],
                    ),
                    Column(
                      children: [
                        LargeCard(
                            image: "assets/curry.png",
                            cardColor: Colors.pink.shade100,
                            name: 'Namaste Pub',
                            description: "Best Indian Food"),
                        SizedBox(height: adjustedHeight(20)),
                        LargeCard(
                            image: "assets/noodle.png",
                            cardColor: Colors.blue.shade100,
                            name: 'Noodle Doodle',
                            description: "Eat everyday"),
                        SizedBox(height: adjustedHeight(20)),
                        LargeCard(
                            image: "assets/taco.png",
                            cardColor: Colors.red.shade100,
                            name: 'Taco Bell',
                            description: "Best Mexican Food"),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
