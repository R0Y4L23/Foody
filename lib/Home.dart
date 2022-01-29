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
      'image': 'assets/pizza_p3.png',
      'subtitle':
          'Pizza is a savory dish of Italian origin, consisting of a usually round, flattened base of leavened wheat-based dough.',
    },
    {
      'title': 'Burger',
      'image': 'assets/burger.png',
      'subtitle':
          'A hamburger is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread roll or bun.',
    },
    {
      'title': 'Noodles',
      'image': 'assets/noodle.png',
      'subtitle':
          'Noodles is a type of food made from unleavened dough which has been stretched and formed into long, flat, cylindrical or layered sheets.',
    },
    {
      'title': 'Chicken',
      'image': 'assets/indian_p3.png',
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
            style: TextStyle(
              fontSize: adjustedSize(25),
              fontWeight: FontWeight.w600,
              color: Colors.black,
              fontFamily: "SedgwickAve",
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
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Joes's Burger",
                                  'image': "assets/burger.png",
                                  'description': "Good Quality Burgers",
                                  'color': Colors.green.shade100,
                                  'products': [
                                    {
                                      "image": "assets/burger_p1.png",
                                      "name": "Large Burger",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized burger with extra cheese and mayo"
                                    },
                                    {
                                      "image": "assets/burger_p2.png",
                                      "name": "Medium Burger",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized burger with two crispy chicken strips"
                                    },
                                    {
                                      "image": "assets/burger_p3.png",
                                      "name": "Small Burger",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized burger with cheese and vegetables"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(
                          height: adjustedHeight(20),
                        ),
                        SmallCard(
                          image: "assets/pizza.png",
                          cardColor: Colors.orange.shade100,
                          name: "Mario's Pizza",
                          description: "Best Pizzas",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Mario's Pizza",
                                  'image': "assets/pizza.png",
                                  'description': "Best Pizzas",
                                  'color': Colors.orange.shade100,
                                  'products': [
                                    {
                                      "image": "assets/pizza_p1.png",
                                      "name": "Large Pizza",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized pizza with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/pizza_p2.png",
                                      "name": "Medium Pizza",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized pizza with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/pizza_p3.png",
                                      "name": "Small Pizza",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized pizza with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        SmallCard(
                          image: "assets/sushi.png",
                          cardColor: Colors.yellow.shade100,
                          name: "Sushi Time",
                          description: "Taste the best",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Sushi Time",
                                  'image': "assets/sushi.png",
                                  'description': "Taste the best",
                                  'color': Colors.yellow.shade100,
                                  'products': [
                                    {
                                      "image": "assets/sushi_p1.png",
                                      "name": "Large Sushi",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized sushi with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/sushi_p2.png",
                                      "name": "Medium Sushi",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized sushi with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/sushi_p3.png",
                                      "name": "Small Sushi",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized sushi with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        SmallCard(
                          image: "assets/salad.png",
                          cardColor: Colors.purple.shade100,
                          name: "Salad Place",
                          description: "Eat Tasty Salads",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Salad Place",
                                  'image': "assets/salad.png",
                                  'description': "Eat Tasty Salads",
                                  'color': Colors.purple.shade100,
                                  'products': [
                                    {
                                      "image": "assets/salad_p1.png",
                                      "name": "Large Salad",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized salad with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/salad_p2.png",
                                      "name": "Medium Salad",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized salad with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/salad_p3.png",
                                      "name": "Small Salad",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized salad with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(height: adjustedHeight(20)),
                      ],
                    ),
                    Column(
                      children: [
                        LargeCard(
                          image: "assets/curry.png",
                          cardColor: Colors.pink.shade100,
                          name: 'Namaste Inn',
                          description: "Best Indian Food",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Namaste Inn",
                                  'image': "assets/curry.png",
                                  'description': "Best Indian Food",
                                  'color': Colors.pink.shade100,
                                  'products': [
                                    {
                                      "image": "assets/indian_p1.png",
                                      "name": "Large Curry",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized curry with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/indian_p2.png",
                                      "name": "Medium Curry",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized curry with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/indian_p3.png",
                                      "name": "Small Curry",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized curry with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        LargeCard(
                          image: "assets/noodle.png",
                          cardColor: Colors.blue.shade100,
                          name: 'Noodle Doodle',
                          description: "Eat everyday",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Noodle Doodle",
                                  'image': "assets/noodle.png",
                                  'description': "Eat everyday",
                                  'color': Colors.blue.shade100,
                                  'products': [
                                    {
                                      "image": "assets/noodles_p1.png",
                                      "name": "Large Noodle",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized noodle with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/noodles_p2.png",
                                      "name": "Medium Noodle",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized noodle with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/noodles_p3.png",
                                      "name": "Small Noodle",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized noodle with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
                        SizedBox(height: adjustedHeight(20)),
                        LargeCard(
                          image: "assets/taco.png",
                          cardColor: Colors.red.shade100,
                          name: 'Taco Bell',
                          description: "Best Mexican Food",
                          onTap: () {
                            Navigator.pushNamed(context, '/restaurant',
                                arguments: {
                                  'name': "Taco Bell",
                                  'image': "assets/taco.png",
                                  'description': "Best Mexican Food",
                                  'color': Colors.red.shade100,
                                  'products': [
                                    {
                                      "image": "assets/taco_p1.png",
                                      "name": "Large Taco",
                                      "price": "Rs. 200",
                                      "description":
                                          "Large sized taco with extra cheese and mayo and mushroom toppings"
                                    },
                                    {
                                      "image": "assets/taco_p2.png",
                                      "name": "Medium Taco",
                                      "price": "Rs. 150",
                                      "description":
                                          "Medium sized taco with extra cheese and onion toppings"
                                    },
                                    {
                                      "image": "assets/taco_p3.png",
                                      "name": "Small Taco",
                                      "price": "Rs. 100",
                                      "description":
                                          "Small sized taco with tomato toppings"
                                    }
                                  ]
                                });
                          },
                        ),
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
