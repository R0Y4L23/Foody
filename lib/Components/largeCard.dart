// ignore_for_file: file_names, prefer_const_constructors

import "package:flutter/material.dart";

class LargeCard extends StatelessWidget {
  const LargeCard({
    Key? key,
    required this.image,
    required this.cardColor,
    required this.name,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  final String image;
  final Color cardColor;
  final String name;
  final String description;
  final Function onTap;

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

    return InkWell(
      child: Container(
        height: adjustedHeight(200),
        width: adjustedWidth(160),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: cardColor,
        ),
        child: Stack(
          children: [
            Positioned(
              child: Image(
                image: AssetImage(image),
                height: adjustedHeight(90),
              ),
              top: 0,
              right: 0,
            ),
            Positioned(
                left: 0,
                bottom: 0,
                child: Padding(
                  padding: EdgeInsets.all(adjustedHeight(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name,
                          style: TextStyle(
                            fontSize: adjustedSize(16),
                            fontWeight: FontWeight.w600,
                          )),
                      SizedBox(
                        height: adjustedHeight(8),
                      ),
                      Text(description,
                          style: TextStyle(
                              fontSize: adjustedSize(12),
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600)),
                    ],
                  ),
                ))
          ],
        ),
      ),
      onTap: () => onTap(),
    );
  }
}
