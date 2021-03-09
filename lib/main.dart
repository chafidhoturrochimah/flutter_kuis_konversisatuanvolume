import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //controller
  TextEditingController etInput = new TextEditingController();

  //variabel berubah
  double _inputUser = 0;

  //mengeset nilai pada dropdown
  String _newValue = "Kelvin";
  double _result = 0;

  //buat list
  var listItem = {"Kelvin", "Reamur"};

  //variable bertipe List<String> (prak 2)
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void konversiSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
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
          end: FractionalOffset.bottomCenter
        ),
        border: Border(bottom: BorderSide(color: Colors.blue[300], width: 5))
      ),
      tabs: <Widget>[
        Tab(icon: Icon(Icons.repeat, color: Colors.white), text: "Konversi",),
        Tab(icon: Icon(Icons.history, color: Colors.white), text: "History",)
      ],
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 2, 
        child: Scaffold(
        appBar: AppBar(
          title: Text("Konversi Satuan Volume", style: TextStyle(color: Colors.white),),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff0096ff), Color(0xff6610f2)],
                begin: FractionalOffset.bottomLeft,
                end: FractionalOffset.topRight
              )
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(myTabBar.preferredSize.height),
            child: Container(
              color: Colors.blue[300], 
              child: myTabBar
            )
          ), 
        ),
        
        body: TabBarView(
          children: <Widget> [
            //konversi
            Center(child: Text("Konversi"),),

            //history
            Center(child: Text("History"),),
          ],
        ),
      ),
      ),
    );
  }
}
