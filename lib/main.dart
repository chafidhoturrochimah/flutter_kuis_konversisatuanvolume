import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  final inputController = TextEditingController();

  //variabel berubah
  double _inputUser = 0;
  double _kiloliter = 0;
  double _liter = 0;
  double _mililiter = 0;

  //mengeset nilai pada dropdown
  String _newValue = "Kiloliter";
  double _result = 0;

  //buat list
  var listItem = {"Kiloliter", "Liter", "Mililiter"};

  //variable bertipe List<String> (prak 2)
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void konversiVolume() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValue == "Kiloliter")
        _result = _inputUser + 273;
      else
        _result = (4 / 5) * _inputUser;
      listViewItem.add("$_newValue : $_result");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TabBar myTabBar = TabBar(
      indicator: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff0096ff), Color(0xff6610f2)],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
          border:
              Border(bottom: BorderSide(color: Colors.blue[300], width: 5))),
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.repeat, color: Colors.white),
          text: "Konversi",
        ),
        Tab(
          icon: Icon(Icons.history, color: Colors.white),
          text: "History",
        )
      ],
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Konversi Satuan Volume",
              style: TextStyle(color: Colors.white),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff0096ff), Color(0xff6610f2)],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight)),
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
                child: Container(color: Colors.blue[300], child: myTabBar)),
          ),
          body: TabBarView(
            children: <Widget>[
              //konversi
              Container(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      DropdownButton<String>(
                        items: listItem.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _newValue,
                        onChanged: dropdownOnChanged,
                        isExpanded: true,
                      ),
                      Center(
                        child: Icon(Icons.repeat),
                      ),

                      DropdownButton<String>(
                        items: listItem.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        value: _newValue,
                        onChanged: dropdownOnChanged,
                        isExpanded: true,
                      ),

                      Container(
                          child: TextFormField(
                          decoration:
                            InputDecoration(hintText: "Masukkan Angka Volume"),
                          inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ] ,
                        controller: inputController,
                        keyboardType: TextInputType.number,
                      )),

                      Center(
                        child: Container(
                          width: 900.0,
                          height: 400.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          gradient: LinearGradient(
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            // Add one stop for each color. Stops should increase from 0 to 1
                            stops: [0.1, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's Colors class.
                              Color(0xff1d83ab),
                              Color(0xff0cbab8),
                            ],
                          ),
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          child: Text(
                            'Konversi',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'Righteous',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          textColor: Colors.white,
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: () {},
                        ),
                      ),
                      )],
                  )),
            

              //history
              Center(
                child: Text("History"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void dropdownOnChanged(String changeValue) {
    setState(() {
      _newValue = changeValue;
    });
  }
}
