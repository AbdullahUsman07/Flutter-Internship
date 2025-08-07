import 'package:day_3/widgets/multi_select_dropdown.dart';
import 'package:flutter/material.dart';

class DropDownFeild extends StatelessWidget {
  const DropDownFeild({
    super.key, 
    required this.title, 
    required this.options, 
    required this.selectedOptions, 
    required this.onSelectionChanged,
    required this.controller,
  });

  final String title;
  final List<String> options;
  final List<String> selectedOptions;
  final Function(List<String>) onSelectionChanged;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 320,
      child: TextFormField(
        readOnly: true,
        controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          label: Text(title, style: TextStyle(color: Colors.white)),
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
          suffixIcon: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return MultiSelectDropdown(
                  options: options,
                  selectedOptions: selectedOptions,
                  onSelectionChanged: onSelectionChanged,
                );
              }));
            },
            icon: Icon(
              Icons.keyboard_arrow_down_sharp,
              color: Color.fromRGBO(255, 79, 0, 1),
            ),
          ),
        ),
      ),
    );
  }
}
