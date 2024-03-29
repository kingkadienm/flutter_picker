import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/src/material/dialog.dart' as Dialog;

import 'Picker.dart';
import 'PickerData.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

//        localizationsDelegates: [
//          PickerLocalizationsDelegate.delegate, // 如果要使用本地化，请添加此行，则可以显示中文按钮
//          GlobalMaterialLocalizations.delegate,
//          GlobalWidgetsLocalizations.delegate,
//        ],
//        supportedLocales: [
//          const Locale('en', 'US'),
//          const Locale('zh', 'CH'),
//        ],

        home: new MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final double listSpec = 4.0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String stateText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Picker'),
        automaticallyImplyLeading: false,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,
        child: ListView(
          children: <Widget>[
            (stateText != null) ? Text(stateText) : Container(),
            RaisedButton(
              child: Text('Picker Show'),
              onPressed: () {
                showPicker(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Modal'),
              onPressed: () {
                showPickerModal(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Icons'),
              onPressed: () {
                showPickerIcons(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show (Array)'),
              onPressed: () {
                showPickerArray(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Number'),
              onPressed: () {
                showPickerNumber(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Number FormatValue'),
              onPressed: () {
                showPickerNumberFormatValue(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Date'),
              onPressed: () {
                showPickerDate(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Datetime'),
              onPressed: () {
                showPickerDateTime(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Date (Custom)'),
              onPressed: () {
                showPickerDateCustom(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Datetime (24)'),
              onPressed: () {
                showPickerDateTime24(context);
              },
            ),
            SizedBox(height: listSpec),
            RaisedButton(
              child: Text('Picker Show Date Range'),
              onPressed: () {
                showPickerDateRange(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  showPicker(BuildContext context) {
    Picker picker = Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        textAlign: TextAlign.left,
        textStyle: const TextStyle(color: Colors.blue),
        selectedTextStyle: TextStyle(color: Colors.red),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        });
    picker.show(_scaffoldKey.currentState);
  }

  showPickerModal(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        changeToFirst: true,
        hideHeader: false,
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(this.context); //_scaffoldKey.currentState);
  }

  showPickerIcons(BuildContext context) {
    Picker(
      adapter: PickerDataAdapter(data: [
        PickerItem(text: Icon(Icons.add), value: Icons.add, children: [
          PickerItem(text: Icon(Icons.more)),
          PickerItem(text: Icon(Icons.aspect_ratio)),
          PickerItem(text: Icon(Icons.android)),
          PickerItem(text: Icon(Icons.menu)),
        ]),
        PickerItem(text: Icon(Icons.title), value: Icons.title, children: [
          PickerItem(text: Icon(Icons.more_vert)),
          PickerItem(text: Icon(Icons.ac_unit)),
          PickerItem(text: Icon(Icons.access_alarm)),
          PickerItem(text: Icon(Icons.account_balance)),
        ]),
        PickerItem(text: Icon(Icons.face), value: Icons.face, children: [
          PickerItem(text: Icon(Icons.add_circle_outline)),
          PickerItem(text: Icon(Icons.add_a_photo)),
          PickerItem(text: Icon(Icons.access_time)),
          PickerItem(text: Icon(Icons.adjust)),
        ]),
        PickerItem(
            text: Icon(Icons.linear_scale),
            value: Icons.linear_scale,
            children: [
              PickerItem(text: Icon(Icons.assistant_photo)),
              PickerItem(text: Icon(Icons.account_balance)),
              PickerItem(text: Icon(Icons.airline_seat_legroom_extra)),
              PickerItem(text: Icon(Icons.airport_shuttle)),
              PickerItem(text: Icon(Icons.settings_bluetooth)),
            ]),
        PickerItem(text: Icon(Icons.close), value: Icons.close),
      ]),
      title: Text("Select Icon"),
      selectedTextStyle: TextStyle(color: Colors.blue),
      onConfirm: (Picker picker, List value) {
        print(value.toString());
        print(picker.getSelectedValues());
      },
    ).show(_scaffoldKey.currentState);
  }

  showPickerDialog(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
            pickerdata: JsonDecoder().convert(PickerData)),
        hideHeader: true,
        title: new Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerArray(BuildContext context) {
    Picker(
        adapter: PickerDataAdapter<String>(
          pickerdata: JsonDecoder().convert(PickerData2),
          isArray: true,
        ),
        hideHeader: true,
        selecteds: [3, 0, 2],
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        cancel: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.child_care)),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerNumber(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
            begin: 0,
            end: 100,
          ),
          NumberPickerColumn(begin: 0, end: 45, jump: 15),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Text("小时"),
          )),
          PickerDelimiter(
              child: Container(
            width: 30.0,
            child: Text("分钟"),
          ))
        ],
        looping: false,
        itemExtent: 15.0,
        hideHeader: false,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).show(_scaffoldKey.currentState);
  }

  showPickerNumberFormatValue(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          NumberPickerColumn(
              begin: 0,
              end: 999,
              onFormatValue: (v) {
                return v < 10 ? "0$v" : "$v";
              }),
          NumberPickerColumn(begin: 100, end: 200),
        ]),
        delimiter: [
          PickerDelimiter(
              child: Container(
            width: 30.0,
            alignment: Alignment.center,
            child: Icon(Icons.more_vert),
          ))
        ],
        looping: true,
        hideHeader: true,
        title: Text("Please Select"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }

  showPickerDate(BuildContext context) {
    Picker(
        hideHeader: true,
        adapter: DateTimePickerAdapter(),
        title: Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }

  showPickerDateCustom(BuildContext context) {
    new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(
          customColumnType: [2, 1, 0, 3, 4],
        ),
        title: new Text("Select Data"),
        selectedTextStyle: TextStyle(color: Colors.blue),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        }).showDialog(context);
  }

  showPickerDateTime(BuildContext context) {
    new Picker(
        adapter: new DateTimePickerAdapter(
          type: PickerDateTimeType.kYMD_AP_HM,
          isNumberMonth: true,
          //strAMPM: const["上午", "下午"],
          yearSuffix: "年",
          monthSuffix: "月",
          daySuffix: "日",
          minValue: DateTime.now(),
          // twoDigitYear: true,
        ),
        title: new Text("Select DateTime"),
        textAlign: TextAlign.right,
        selectedTextStyle: TextStyle(color: Colors.blue),
        delimiter: [
          PickerDelimiter(
              column: 5,
              child: Container(
                width: 16.0,
                alignment: Alignment.center,
                child: Text(':', style: TextStyle(fontWeight: FontWeight.bold)),
                color: Colors.white,
              ))
        ],
        footer: Container(
          height: 50.0,
          alignment: Alignment.center,
          child: Text('Footer'),
        ),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        }).show(_scaffoldKey.currentState);
  }

  showPickerDateRange(BuildContext context) {
    print("canceltext: ${PickerLocalizations.of(context).cancelText}");

    Picker ps = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kYMD, isNumberMonth: true),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        });

    Picker pe = new Picker(
        hideHeader: true,
        adapter: new DateTimePickerAdapter(type: PickerDateTimeType.kYMD),
        onConfirm: (Picker picker, List value) {
          print((picker.adapter as DateTimePickerAdapter).value);
        });

    List<Widget> actions = [
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: new Text(PickerLocalizations.of(context).cancelText)),
      FlatButton(
          onPressed: () {
            Navigator.pop(context);
            ps.onConfirm(ps, ps.selecteds);
            pe.onConfirm(pe, pe.selecteds);
          },
          child: new Text(PickerLocalizations.of(context).confirmText))
    ];

    Dialog.showDialog(
        context: context,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text("Select Date Range"),
            actions: actions,
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Begin:"),
                  ps.makePicker(),
                  Text("End:"),
                  pe.makePicker()
                ],
              ),
            ),
          );
        });
  }

  showPickerDateTime24(BuildContext context) {
    new Picker(
        adapter: new DateTimePickerAdapter(
            type: PickerDateTimeType.kMDYHM,
            isNumberMonth: true,
            yearSuffix: "年",
            monthSuffix: "月",
            daySuffix: "日"),
        title: new Text("Select DateTime"),
        onConfirm: (Picker picker, List value) {
          print(picker.adapter.text);
        },
        onSelect: (Picker picker, int index, List<int> selecteds) {
          this.setState(() {
            stateText = picker.adapter.toString();
          });
        }).show(_scaffoldKey.currentState);
  }
}
