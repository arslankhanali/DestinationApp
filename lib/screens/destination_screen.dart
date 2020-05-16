import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/activity_model.dart';
import '../models/destination_model.dart';

class DestinationScreen extends StatefulWidget {
  final Destination destination;

  DestinationScreen({Key key, this.destination});

  @override
  _DestinationScreenState createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {

  Text _buildRatingStars(int rating){
    String stars='';
    for (var i = 0; i < rating; i++) {
      stars+='⭐ ';
      stars.trim();
      
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 2.0),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Hero(
                tag: widget.destination.imageUrl,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    image: AssetImage(widget.destination.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () => Navigator.pop(context),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.sortAmountDown),
                        iconSize: 35.0,
                        color: Colors.black,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Column(
                children: <Widget>[
                  Text(
                    widget.destination.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 15.0,
                        color: Colors.grey[300],
                      ),
                      Text(
                        '   ${widget.destination.country}',
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 20.0,
              child: Icon(
                Icons.location_on,
                color: Colors.white70,
                size: 25.0,
                //semanticLabel: 'Text to announce in accessibility modes',
              ),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding:  EdgeInsets.only(top:10.0,bottom: 10.0),
            itemCount: widget.destination.activities.length,
            itemBuilder: (BuildContext context, int index) {
              Activity activity = widget.destination.activities[index];
              return Stack(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100,20.0,20.0,20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    activity.name,
                                    style: TextStyle(
                                      //color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w600,
                                      //letterSpacing: 1.2,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  maxLines: 2,),
                                  
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      '\$${activity.price}',
                                      style: TextStyle(
                                        //color: Colors.white,
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        //letterSpacing: 1.2,
                                      ),
                                    ),
                                    Text(
                                      'per Pax',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 14.0,
                                        //fontWeight: FontWeight.w600,
                                        //letterSpacing: 1.2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Text(activity.type),
                            _buildRatingStars(activity.rating),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.,
                              
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(2.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[0]),
                                ),
                                SizedBox(
                              width: 10.0,
                            ),
                                Container(
                                  padding: EdgeInsets.all(2.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(activity.startTimes[1]),
                                )
                              ],
                            )
                          ],
                        ),
                      ),),
                      Positioned(
                        left:20.0,
                        top: 30.0,
                        bottom: 30.0,
                                              child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                            width:110.0,
                            image: AssetImage(activity.imageUrl),
                            fit: BoxFit.cover,
                            ),
                            
                        ),
                      )
                ],
              );
            },
          ),
        ),
      ],
    ));
  }
}
