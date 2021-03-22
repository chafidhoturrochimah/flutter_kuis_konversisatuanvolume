import 'package:flutter/material.dart';

//mengubah Result.dart sehingga memiliki tampilan dan hanya menerima 1 variabel.
class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.result,
  }) : super(key: key);

  final double result;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Hasil",
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'CandaraBold',
              ),
            ),
          ),
          Center(
            child: Text(
              result.toString(),
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'CandaraBold',
              ),
            ),
          )
        ],
      ),
    );
  }
}