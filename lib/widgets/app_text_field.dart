import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    this.type = TextInputType.text,
    this.radius=10,
    this.maxlength,

    this.prefixColor=Colors.blue,
    this.obsecure =false,
    this.color=Colors.blue,
    this.ontap,

    required this.controller,
   // required this.prefixIcon,
    required this.hint,
    this.onChange,

  }) : super(key: key);
  final TextInputType type;
  final bool obsecure;
  //final IconData prefixIcon;
  final TextEditingController controller;
  final String hint;
  final double radius;
  final Color color;
  final Color prefixColor;
  final void Function(String value)? onChange;
  final void Function()? ontap;
  final int? maxlength;

  @override
  Widget build(BuildContext context) {
    return TextField(
maxLength: maxlength,
      keyboardType: type,
      obscureText: obsecure,
      controller: controller,
      onChanged: onChange,
      onTap: ontap,
      decoration: InputDecoration(
          hintText: hint,
         // prefixIcon: Icon(prefixIcon,color: prefixColor,),
          enabledBorder: border(),
          focusedBorder: border(borderColor:color)
      ),
    );
  }
  OutlineInputBorder border({Color borderColor = Colors.grey}) {

    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius),
        borderSide: BorderSide(
          width: 1,
          color:borderColor,
        )
    );
  }}