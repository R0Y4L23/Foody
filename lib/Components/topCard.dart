// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable

import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class TopCard extends StatelessWidget {
  TopCard(
      {Key? key,
      required this.cardColor,
      required this.cardTitle,
      required this.cardSubtitle,
      required this.cardImage})
      : super(key: key);

  Color cardColor;
  String cardTitle;
  String cardSubtitle;
  String cardImage;

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

    return Container(
        width: adjustedWidth(335),
        margin: EdgeInsets.only(right: adjustedWidth(20)),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: cardColor,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: adjustedWidth(10),
              child: Image(
                image: AssetImage(cardImage),
                height: adjustedHeight(80),
                width: adjustedWidth(80),
              ),
            ),
            Positioned(
                width: adjustedWidth(220),
                top: adjustedHeight(8),
                right: adjustedWidth(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cardTitle,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: adjustedSize(18),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                    SizedBox(
                      height: adjustedHeight(10),
                    ),
                    Text(cardSubtitle,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                            fontSize: adjustedSize(12),
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ))
          ],
        ));
  }
}
