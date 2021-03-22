import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  const Input({
    Key key,
    @required this.inputController,
  }) : super(key: key);

  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            decoration:
            InputDecoration(
              hintText: "Masukkan Angka Volume",
              hintStyle: TextStyle(
                fontFamily: 'Candara'
              )
            ),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly
            ],
            controller: inputController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}