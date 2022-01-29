// ignore_for_file: file_names, prefer_const_constructors, sized_box_for_whitespace

import "package:flutter/material.dart";

class RestaurantItemCard extends StatelessWidget {
  const RestaurantItemCard(
      {Key? key,
      required this.image,
      required this.name,
      required this.price,
      required this.description})
      : super(key: key);

  final String image;
  final String name;
  final String description;
  final String price;

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

    return Padding(
      padding: EdgeInsets.only(
          left: adjustedWidth(20),
          right: adjustedWidth(20),
          bottom: adjustedHeight(10)),
      child: Row(
        children: [
          Container(
            height: adjustedHeight(100),
            width: adjustedWidth(100),
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(adjustedHeight(10))),
            child: Image(
              image: AssetImage(image),
              height: adjustedHeight(100),
              width: adjustedWidth(60),
            ),
          ),
          SizedBox(width: adjustedWidth(20)),
          Container(
            width: adjustedWidth(200),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontSize: adjustedSize(20), fontWeight: FontWeight.w600),
                ),
                SizedBox(height: adjustedHeight(10)),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: adjustedSize(10),
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: adjustedHeight(10)),
                Text(
                  price,
                  style: TextStyle(
                      fontSize: adjustedSize(15),
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
