import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
String Token = "";
Widget login_eve_button({
  required String text,
  required Color Text_color,
  required Color border_color,
  required Color button_color,
  double radius = 20,
  required VoidCallback function,
}) {
  return Container(
    width: double.infinity,
    color: Colors.white,
    child: ElevatedButton(
      onPressed: function,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Text(
          "$text",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Text_color,
            fontSize: 20,

          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: button_color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: border_color))),
    ),
  );
}
Widget login_Textfield({
  required String text,
  required TextEditingController control,
  // int? max_size,
  double radius = 20,
  IconData? perfix,
  IconData? suffix,
  Color? Icon_color,
  required TextInputType type,
  bool is_password = false,
  onSubmit,
  Function? suffixPressed,
}) {
  return TextFormField(
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      obscureText: is_password,
      controller: control,
      // maxLines: max_size,
      decoration: InputDecoration(
          label: Text('$text'),
          // prefixIcon: Icon(perfix),
          suffixIcon: suffix != null
              ? IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(
              suffix,color: HexColor("#625FC9"),
            ),
          )
              : SizedBox(),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          )));
}
