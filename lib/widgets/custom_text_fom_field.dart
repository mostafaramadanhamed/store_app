import 'package:flutter/material.dart';

class CustomTextFormFiled extends StatelessWidget {
  CustomTextFormFiled({
    this.onChange ,
    required this.hint,
    required this.type,
    this.suffix,
    this.suffixPressed,}) ;
  String ?hint;
  Function(String) ? onChange;
  TextInputType type;
  IconData? suffix;
  Function ?suffixPressed;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (data){
        if(data!.isEmpty){
          return ' Field is required';
        }
      },
      keyboardType: type,
      onChanged: onChange,
      cursorColor: Colors.red,
      decoration: InputDecoration(
        filled: true,
        suffixIcon:suffix!=null ? IconButton(
          onPressed: ()
          {suffixPressed!();},
          icon: Icon(suffix,color: Colors.red[400],)
          ,): null ,
        fillColor: Colors.white,
        hintText: hint,
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.red
            ),
            borderRadius: BorderRadius.circular(24)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(24)
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.black,
            ),

            borderRadius: BorderRadius.circular(24)
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.black
          ),
        ),
      ),
    );
  }
}


