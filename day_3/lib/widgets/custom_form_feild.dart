
import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  CustomFormFeild({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.errorText,
    this.isPass = false,
  });

  final String title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  bool obscureText;
  final String? errorText;
  final void Function(String)? onChanged;
  final bool isPass;

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();
}

class _CustomFormFeildState extends State<CustomFormFeild> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.isPass
            ? InkWell(
                child: widget.obscureText
                    ? Icon(
                        Icons.visibility_off,
                        color: Color.fromRGBO(255, 79, 0, 1),
                      )
                    : Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(255, 79, 0, 1),
                      ),
                onTap: () => setState(() {
                  widget.obscureText = !widget.obscureText;
                }),
              )
            : null,
        errorText: widget.errorText,
        label: Text(widget.title, style: TextStyle(color: Colors.white)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 79, 0, 1),
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(
            color: Color.fromRGBO(255, 79, 0, 1),
            width: 2,
          ),
        ),
      ),
    );
  }
}
