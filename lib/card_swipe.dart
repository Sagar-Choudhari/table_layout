import 'package:flutter/cupertino.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'dart:math' as math;

import 'package:flutter/material.dart';

class CardSwipe extends StatefulWidget {
  const CardSwipe({Key? key}) : super(key: key);

  @override
  State<CardSwipe> createState() => _CardSwipeState();
}

class _CardSwipeState extends State<CardSwipe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(

        child: SizedBox(

          height: MediaQuery.of(context).size.height * 0.75,
          child: AppinioSwiper(
            cardsCount: 100,
            cardsBuilder: (BuildContext context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [
                        // Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        Color((math.Random().nextDouble() * 0xFFFFFF)
                            .toInt())
                            .withOpacity(1.0),
                        Color((math.Random().nextDouble() * 0xFFFFFF)
                            .toInt())
                            .withOpacity(1.0)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        child: const Icon(Icons.person,
                            size: 24, color: Colors.white),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12),
                              bottomLeft: Radius.circular(12)),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: const Text("Student",
                      style: TextStyle(
                        color: Colors.black,

                      ),),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
/*
Column(
children: [
Container(
width: MediaQuery.of(context).size.width,
height: 200,
alignment: Alignment.center,
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [
// Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
    .withOpacity(1.0),
Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
    .withOpacity(1.0)
],
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
tileMode: TileMode.mirror),
),
),
Text(
(index + 1).toString(),
style: TextStyle(
fontSize: index + 37, fontWeight: FontWeight.bold),
),
Text(
"(index + 1).toString()",
style: TextStyle(
fontSize: index + 17, fontWeight: FontWeight.bold),
),
],
),*/
