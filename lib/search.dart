import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guzogoclone/widgets/GuzogoButton.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<bool> _isSelected = [false, true];
  List<String> labels = ["Return", "One-Way"];
  int currentIndex = 0;
  double iconSize = 20;
  int adult = 0;
  int childd = 0;
  int infant = 0;
  int passangerval = 0;

  //variable for the table
  Color color = Colors.black12;
  double width = 1.0;
  BorderStyle style = BorderStyle.solid;

  //from and to places
  List<String> from = ['ADD', 'Addis Abeba', 'Bole International Airport'];
  List<String> to = ['ABJ', 'Abidjan', 'Part Bouet Airport'];
  List<String> temp = [];

  //date picker function
  DateTime selectedDate = DateTime.now();
  DateTime returnDate = DateTime.now();
  int way = 0;
  //String retdate =  returnDate.toLocal().split(' ')[0];
  //variables for cabin class
  List list1 = ['Economy', 'Bussiness', 'First'];
  String selection = 'Economy';

  //passangers list
  List list2 = ['Adult', 'Children 2-12 Years', 'Infant < 2 Years'];
  List<int> passlist = [0, 0, 0];
  // String select = 'Economy';

  Widget _cabinItems(context, index) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
          top: 1.0,
          bottom: 1,
        ),
        child: Text(
          list1[index],
          style: TextStyle(
            fontFamily: 'fontAwesomeSolid',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        Navigator.pop(context, list1[index]);
      },
    );
  }

  Widget _passangerItems(context, index) {
    return ListTile(
      title: Padding(
        padding: EdgeInsets.only(
          top: 1.0,
          bottom: 1,
        ),
        child: Row(
          children: [
            Text(
              list2[index],
              style: TextStyle(
                fontFamily: 'fontAwesomeSolid',
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            Spacer(),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {
                    setState(() {
                      passlist[index]--;
                    });
                  },
                  splashColor: Colors.black12,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.remove_circle_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(passlist[index].toString()),
                ),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      passlist[index]++;
                    });
                  },
                  splashColor: Colors.black12,
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Icon(
                        Icons.add_circle_outline,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.pop(context, list2[index]);
      },
    );
  }

  ///bottom sheet for cabin class
  Future _openshowModalBottomSheet(BuildContext context, index) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 11,
            ),
            // padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 238,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "Cabin Class",
                        style: TextStyle(
                            fontFamily: 'fontAwesomeSolid',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 200,
                      ),
                      FlatButton(
                        onPressed: () => Navigator.pop(
                          context,
                          list1[index],
                        ),
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 13.0, bottom: 13.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          child: ListView.separated(
                            itemCount: 3,
                            shrinkWrap: true,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                              height: 1,
                            ),
                            itemBuilder: _cabinItems,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
    setState(() {
      selection = option;
    });
  }

  ///bottom sheet for passengers
  Future _openshowBottomSheetPassengers(BuildContext context) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 11,
            ),
            // padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 238,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "Passengers",
                        style: TextStyle(
                            fontFamily: 'fontAwesomeSolid',
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(
                        width: 110,
                      ),
                      FlatButton(
                        onPressed: () => Navigator.pop(
                          context,
                        ),
                        child: Text("Cancel"),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Done",
                          style: TextStyle(
                              fontFamily: 'fontAwesomeSolid',
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 9.0, bottom: 13.0, right: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          child: Flexible(
                            child: ListView.separated(
                              itemCount: 3,
                              shrinkWrap: true,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const Divider(
                                height: 1,
                              ),
                              itemBuilder: _passangerItems,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  //date picker widget
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Select booking date',
      // Can be used as title
      // cancelText: 'Not now',
      // confirmText: 'Book',
    );

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.rtl,
      fit: StackFit.expand,
      overflow: Overflow.clip,
      clipBehavior: Clip.hardEdge,
      children: [
        //first half of the screen
        Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 2,
          margin: EdgeInsets.only(top: 24.0),
          decoration: new BoxDecoration(
            color: Color(0XFF1F1C68),
            image: new DecorationImage(
              image: new AssetImage('images/realend.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: new Container(
            decoration:
                new BoxDecoration(color: Color(0XFF1F1C68).withOpacity(0.95)),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //for logo
                Center(
                  child: Image.asset(
                    'images/guzlogo.PNG',
                    // fit: BoxFit.cover,
                    width: 80,
                    height: 95,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                // Here default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor

                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(75.0))),
                  //Toggle tab from Fluttertoogletab package
                  child: FlutterToggleTab(
                    width: MediaQuery.of(context).size.width / 4 - 10,
                    height: 31,
                    borderRadius: 15,
                    initialIndex: 0,
                    selectedTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'fontAwesomeSolid',
                        fontWeight: FontWeight.w600),
                    unSelectedBackgroundColors: [Colors.transparent],
                    selectedBackgroundColors: [Colors.white],
                    unSelectedTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'fontAwesome',
                        fontWeight: FontWeight.w400),
                    labels: ["Return", "one-Way"],
                    selectedLabelIndex: (index) {
                      if (index == 1) {
                        setState(() {
                          way = 1;
                        });
                      } else if (index == 0) {
                        setState(() {
                          way = 0;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'From',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'fontAwesomeRegular'),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              from[0],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'fontAwesomeSolid'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                from[1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'fontAwesome'),
                              ),
                            ),
                            Text(
                              from[2],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontFamily: 'fontAwesome'),
                            ),
                          ],
                        ),
                      ),
                    ),

                    //centeral exchange button
                    Center(
                      child: IconButton(
                        color: Colors.white,
                        icon: Icon(
                          Icons.exposure,
                          color: Colors.white,
                        ),
                        tooltip: 'exchange',
                        onPressed: () {
                          setState(() {
                            temp = from;
                            from = to;
                            to = temp;
                          });
                        },
                      ),
                    ),
                    //space between button to To

                    //To container begin here
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Column(
                          children: [
                            Text(
                              'To',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'fontAwesomeSolid'),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text(
                              to[0],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'fontAwesome'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                to[1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontFamily: 'fontAwesome'),
                              ),
                            ),
                            Text(
                              to[2],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontFamily: 'fontAwesome'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        //second half of the screen begin here..
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          top: MediaQuery.of(context).size.height / 2 - 43,
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 2 - 20,
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  // margin: EdgeInsets.all(1),
                  child: Table(
                    border: TableBorder(
                      top: BorderSide.none,
                      right: BorderSide.none,
                      bottom:
                          BorderSide(color: color, width: width, style: style),
                      left: BorderSide.none,
                      horizontalInside:
                          BorderSide(color: color, width: width, style: style),
                      verticalInside:
                          BorderSide(color: color, width: width, style: style),
                    ),
                    columnWidths: {
                      0: FractionColumnWidth(.5),
                      1: FractionColumnWidth(.5),
                    },
                    // defaultColumnWidth: IntrinsicColumnWidth(),
                    children: [
                      TableRow(children: [
                        //departure cell begins here
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 11,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Departure Date'),
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0, top: 15.0),
                                      child: Text(
                                        "${selectedDate.toLocal()}"
                                            .split(' ')[0],
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),

                        //Return date cell begin here
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 11,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Return Date'),
                                GestureDetector(
                                  onTap: () => _selectDate(context),
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0, top: 15.0),
                                      child: Text(
                                        way == 0
                                            ? "${returnDate.toLocal()}"
                                                .split(' ')[0]
                                            : " ",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ]),
                      TableRow(children: [
                        //cabin cell begins here
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 11,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _openshowModalBottomSheet(context, list1);
                            },
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text('Cabin Class'),
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8.0, top: 15.0),
                                      child: Text(
                                        "${selection}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ]),
                          ),
                        ),

                        //passengers cell begeins here
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                            top: 11,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _openshowBottomSheetPassengers(context);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text('Passengers'),
                                Container(
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 8.0, top: 15.0),
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.male,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(passlist[0].toString()),
                                        SizedBox(
                                          width: 17,
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.child,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(passlist[1].toString()),
                                        SizedBox(
                                          width: 17,
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.baby,
                                          size: 16,
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Text(passlist[2].toString()),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ]),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),

                //search button is begin here
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    child: GuzogoButton(
                      title: 'Search Flights',
                      color: Colors.amberAccent,
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
