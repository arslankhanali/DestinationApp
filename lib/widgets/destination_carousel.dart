import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/screens/destination_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/destination_model.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Top Destination',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.0,
              ),
            ),
            GestureDetector(
              onTap: () => print('See All'),
              child: Text(
                'See All',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
          height: 300.0,
          //color: Colors.blue,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (BuildContext context, int index) {
              Destination destination = destinations[index];

              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DestinationScreen(
                      destination: destination,
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  //color: Colors.red,
                  width: 210.0,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 15.0,
                        child: Container(
                            height: 120.0,
                            width: 210.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      '${destination.activities.length} activities',
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w800,
                                        letterSpacing: 0.5,
                                      )),
                                  Text(destination.description,
                                      style: TextStyle(
                                        fontSize: 13.0,
                                        color: Colors.grey,
                                        letterSpacing: 0.5,
                                      )),
                                ],
                              ),
                            )),
                      ),
                      Container(
                          height: 160.0,
                          width: 200.0,
                          decoration: BoxDecoration(
                            //color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 20.0,
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: <Widget>[
                              Hero(
                                tag: destination.imageUrl,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image(
                                    height: 180.0,
                                    width: 180.0,
                                    image: AssetImage(destination.imageUrl),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 15.0,
                                bottom: 10.0,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      destination.city,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 1.2,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.locationArrow,
                                          size: 10.0,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          '   ${destination.country}',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              );
            },
          ))
    ]);
  }
}
