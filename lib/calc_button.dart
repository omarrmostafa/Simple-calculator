import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  String numbutton;
  Function onClick;

  CalcButton(this.numbutton, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onClick(numbutton);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
            child: Text(
              numbutton,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white),
            )));
  }
}
