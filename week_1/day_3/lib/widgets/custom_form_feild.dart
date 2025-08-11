
import 'package:flutter/material.dart';

class CustomFormFeild extends StatefulWidget {
  CustomFormFeild({
    super.key,
    required this.title,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.initialObscureText = false,
    this.onChanged,
    this.errorText,
    this.isPass = false,
  });

  final String title;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool initialObscureText; 
  final String? errorText;
  final void Function(String)? onChanged;
  final bool isPass;

  @override
  State<CustomFormFeild> createState() => _CustomFormFeildState();


}

class _CustomFormFeildState extends State<CustomFormFeild> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPass ? true : widget.initialObscureText;
  }
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 320,
      child: TextFormField(
        onChanged: widget.onChanged,
        obscureText: _obscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.isPass
              ? InkWell(
                  child: _obscureText
                      ? Icon(
                          Icons.visibility,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Color.fromRGBO(255, 79, 0, 1),
                        ),
                  onTap: () => setState(() {
                    _obscureText = !_obscureText;
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
      ),
    );
  }
}