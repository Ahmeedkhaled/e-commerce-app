import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
String? fieldName;
String? hintText;
Widget? suffixIcon;
bool? IsObscure;
var keyBoardType;
TextEditingController controller;
String? Function(String?)? validator;
TextFieldItem ({
  required this.fieldName,
  required this.controller,
  this.IsObscure=false,this.
  keyBoardType=TextInputType.text,
  required this.hintText,
  required this.validator,
  this.suffixIcon
  });
@override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            fieldName??"",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: validator,
            controller:controller ,
            obscureText:IsObscure??false ,
            keyboardType:keyBoardType ,
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                suffixIcon:suffixIcon ,
                border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius:BorderRadius.circular(15)
                ),
                hintText: hintText,
                focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius:BorderRadius.circular(15)
                )
            ),
          )
        ],
      ),
    );
  }
}
