import 'package:flutter/material.dart';
import 'Convert.dart';
import 'Input.dart';
import 'Result.dart';
import 'RiwayatKonversi.dart';

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
  double _kl = 0;
  double _hl = 0;
  double _dal = 0;
  double _l = 0;
  double _dl = 0;
  double _cl = 0;
  double _ml = 0;

  //mengeset nilai pada dropdown
  String _newValueNaik;
  String _newValueTurun;
  double _result = 0;

  //buat list
  var listNaik = {"Kl", "Hl", "Dal","L", "Dl", "Cl","Ml"};
  var listTurun = {"Kl", "Hl", "Dal","L", "Dl", "Cl","Ml"};

  //variable bertipe List<String> (prak 2)
  // ignore: deprecated_member_use
  List<String> listViewItem = List<String>();

  //Fungsi perhitungan suhu perlu untuk diubah sehingga hanya memproses konversi sesuai
  //dengan pilihan pengguna.
  void konversiVolume() {
    setState(() {
      _inputUser = double.parse(inputController.text);
      if (_newValueNaik == "Kl" && _newValueTurun == "Kl")
        _result = _inputUser;
      else if (_newValueNaik == "Kl" && _newValueTurun == "Hl")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "Kl" && _newValueTurun == "Dal")
        _result = _inputUser * 100 ;
      else if (_newValueNaik == "Kl" && _newValueTurun == "L")
        _result = _inputUser * 1000 ;
      else if (_newValueNaik == "Kl" && _newValueTurun == "Dl")
        _result = _inputUser * 10000 ;
      else if (_newValueNaik == "Kl" && _newValueTurun == "Cl")
        _result = _inputUser * 100000 ;
      else if (_newValueNaik == "Kl" && _newValueTurun == "Ml")
        _result = _inputUser * 1000000 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Kl")
        _result = _inputUser / 10 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Hl")
        _result = _inputUser;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Dal")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "L")
        _result = _inputUser * 100 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Dl")
        _result = _inputUser * 1000 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Cl")
        _result = _inputUser * 10000 ;
      else if (_newValueNaik == "Hl" && _newValueTurun == "Ml")
        _result = _inputUser * 100000 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Kl")
        _result = _inputUser / 100 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Hl")
        _result = _inputUser / 10 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Dal")
        _result = _inputUser;
      else if (_newValueNaik == "Dal" && _newValueTurun == "L")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Dl")
        _result = _inputUser * 100 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Cl")
        _result = _inputUser * 1000 ;
      else if (_newValueNaik == "Dal" && _newValueTurun == "Ml")
        _result = _inputUser * 10000 ;
      else if (_newValueNaik == "L" && _newValueTurun == "Kl")
        _result = _inputUser / 1000 ;
      else if (_newValueNaik == "L" && _newValueTurun == "Hl")
        _result = _inputUser / 100 ;
      else if (_newValueNaik == "L" && _newValueTurun == "Dal")
        _result = _inputUser / 10 ;
      else if (_newValueNaik == "L" && _newValueTurun == "L")
        _result = _inputUser;
      else if (_newValueNaik == "L" && _newValueTurun == "Dl")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "L" && _newValueTurun == "Cl")
        _result = _inputUser * 100 ;
      else if (_newValueNaik == "L" && _newValueTurun == "Ml")
        _result = _inputUser * 1000 ;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Kl")
        _result = _inputUser / 10000 ;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Hl")
        _result = _inputUser / 1000 ;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Dal")
        _result = _inputUser / 100 ;
      else if (_newValueNaik == "Dl" && _newValueTurun == "L")
        _result = _inputUser / 10;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Dl")
        _result = _inputUser;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Cl")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "Dl" && _newValueTurun == "Ml")
        _result = _inputUser * 100 ;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Kl")
        _result = _inputUser / 100000 ;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Hl")
        _result = _inputUser / 10000 ;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Dal")
        _result = _inputUser / 1000 ;
      else if (_newValueNaik == "Cl" && _newValueTurun == "L")
        _result = _inputUser / 100;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Dl")
        _result = _inputUser / 10;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Cl")
        _result = _inputUser;
      else if (_newValueNaik == "Cl" && _newValueTurun == "Ml")
        _result = _inputUser * 10 ;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Kl")
        _result = _inputUser / 1000000 ;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Hl")
        _result = _inputUser / 100000 ;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Dal")
        _result = _inputUser / 10000 ;
      else if (_newValueNaik == "Ml" && _newValueTurun == "L")
        _result = _inputUser / 1000;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Dl")
        _result = _inputUser / 100;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Cl")
        _result = _inputUser / 10;
      else if (_newValueNaik == "Ml" && _newValueTurun == "Ml")
        _result = _inputUser;
      listViewItem.add("$_newValueNaik ke $_newValueTurun = $_result");
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Satuan Volume",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'CandaraBold',
              ),
            ),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff0096ff), Color(0xff6610f2)],
                      begin: FractionalOffset.bottomLeft,
                      end: FractionalOffset.topRight)),
            ),
          ),

          body: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [
                        //pilih
                        Container(                           
                          child: DropdownButton(
                            hint: Text(
                              "Pilih Satuan Volume",
                              style: TextStyle(
                                fontFamily: 'Candara',
                              ),
                            ),
                            value: _newValueNaik,
                            items: listNaik.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontFamily: 'Candara',
                                  ),
                                ),
                                value: value,
                              );
                              }).toList(),
                              onChanged: (String changeValue) {
                                setState(() {
                                  _newValueNaik = changeValue;
                                });
                              },
                          ),
                        ),

                        Center(child: Icon(Icons.repeat)),

                        Container(
                          child: DropdownButton(
                            hint: Text(
                              "Pilih Satuan Volume",
                              style: TextStyle(
                                fontFamily: 'Candara',
                              ),
                            ),
                            value: _newValueTurun,
                            items: listTurun.map((value) {
                              return DropdownMenuItem(
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontFamily: 'Candara',
                                  ),
                                ),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (String changeValue) {
                              setState(() {
                                _newValueTurun = changeValue;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                ),

                //input
                Input(
                  inputController: inputController
                ),

                //hasil
                Result(
                  result: _result,
                ),
    
                //button
                Convert(
                  konvertHandler: konversiVolume,
                ),
                      
                //riwayat
                Container(
                  margin: EdgeInsets.all(8),
                  child: Text(
                    'Riwayat Konversi',
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'CandaraBold'
                    ),
                  ),
                ),
                RiwayatKonversi(
                  listViewItem: listViewItem
                ),
              ],
            )
          ),    
      ),
    );  
  }
}
