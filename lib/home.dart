import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_date_picker_style.dart';
import 'package:flutter_rounded_date_picker/src/material_rounded_year_picker_style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime dateTime;
  Duration duration;

  @override
  void initState() {
    dateTime = DateTime.now();
    duration = Duration(minutes: 10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBody() {
      return Column(
        children: <Widget>[
          Container(

            child: Center(
              child: Column(
              //  mainAxisSize: MainAxisSize.min,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              // padding: const EdgeInsets.only(bottom: 5),
              children: <Widget>[

                const Text(
                  "Rounded",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),

                 FloatingActionButton.extended(
                  onPressed: () async {
                    DateTime newDateTime = await showRoundedDatePicker(
                      background: Colors.black,
                        context: context,
                       //  theme: ThemeData(primarySwatch: Colors.deepPurple),

                        styleDatePicker: MaterialRoundedDatePickerStyle(
                          textStyleDayButton: TextStyle(fontSize: 18,fontFamily:'SFProDisplay'),
                          textStyleYearButton: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          textStyleDayHeader: TextStyle(
                            fontSize: 14,
                            // color: Color.fromRGBO(243,243,246,0.9),
                            color:Color(0xffeaf6f6),
                          ),
                          textStyleCurrentDayOnCalendar:
                              TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          textStyleDayOnCalendar:  TextStyle(fontSize: 12, color: Colors.black),
                          textStyleDayOnCalendarSelected:
                              TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          // textStyleDayOnCalendarDisabled: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.1)),
                          textStyleMonthYearHeader:
                              TextStyle(fontFamily:'SFProDisplay',fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                          paddingDatePicker: EdgeInsets.all(0),
                       //   marginDatePicker: EdgeInsets.all(0),
                          paddingMonthHeader: EdgeInsets.all(20),
                            paddingDateYearHeader: EdgeInsets.all(10),
                          sizeArrow: 25,
                          colorArrowNext: Colors.black,
                          colorArrowPrevious: Colors.black,
                          marginLeftArrowPrevious: 16,
                          marginTopArrowPrevious: 16,
                          marginTopArrowNext: 16,
                          marginRightArrowNext: 16,
                           textStyleButtonPositive:
                              TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                          textStyleButtonNegative: TextStyle(fontSize: 14, color: Colors.black,fontWeight: FontWeight.bold),
                          decorationDateSelected: BoxDecoration(color: Color.fromRGBO(101, 147, 150, 3.0), shape: BoxShape.circle),
                          backgroundPicker: Colors.white,
                          backgroundActionBar: Colors.white,
                          backgroundHeaderMonth: Colors.white,
                          backgroundHeader: Colors.white,
                        ),
                        styleYearPicker: MaterialRoundedYearPickerStyle(
                          textStyleYear: TextStyle(fontSize: 18, color: Colors.black),
                          textStyleYearSelected:
                              TextStyle( fontSize: 22, color:  Color.fromRGBO(101, 147, 150, 3.0),),
                           backgroundPicker: Colors.white,
                        ),

                        textPositiveButton: "OK",
                        textNegativeButton: "CANCEL",
                        customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],

                        onTapDay: (DateTime dateTime, bool available) {
                          if (!available) {
                            showDialog(
                                context: context,
                                builder: (c) => CupertinoAlertDialog(title: Text("This date cannot be selected."),actions: <Widget>[
                                  CupertinoDialogAction(child: Text("OK"),onPressed: (){
                                    Navigator.pop(context);
                                  },)
                                ],));
                          }
                          return available;
                        },

                        );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  label: Text("Custom style"),
                ),
                const SizedBox(height: 12),

                 FloatingActionButton.extended(
                  onPressed: () async {
                    DateTime newDateTime = await showRoundedDatePicker(
                      context: context,
                      theme: ThemeData(
                        primaryColor:Colors.black,
                        dialogBackgroundColor: Colors.white,
                        accentColor: Color.fromRGBO(101, 147, 150, 3.0),

                        textTheme: TextTheme(
                          bodyText2: TextStyle(color: Colors.black),
                          caption: TextStyle(color: Colors.black),
                        ),
                        disabledColor: Colors.black,
                        accentTextTheme: TextTheme(
                          bodyText1: TextStyle(color: Colors.black),
                        ),
                      ),
                    );
                    if (newDateTime != null) {
                      setState(() => dateTime = newDateTime);
                    }
                  },
                  label: const Text("Custom Theme"),
                ),





              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Rounded Date Picker'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: _buildBody(),
      ),
    );
  }
}
