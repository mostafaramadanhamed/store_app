import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTab, required this.text}) ;
  String text;
  VoidCallback ? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Color(0xffFEC8C8),
              Color(0xffE34949),
              Colors.redAccent,
              Colors.red,
              Color(0xff980C1E),
              Colors.black,
            ]),
            borderRadius: BorderRadius.circular(24)
        ),
        width: double.infinity,
        height: 50,
        child: Center(child: Text(text,style: const TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontFamily: 'Pacifico',
        ),)),
      ),
    );
  }
}
