

import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.searchController,
    this.color = Colors.white,
    this.readOnly = false, // Add readOnly parameter
  });

  final TextEditingController searchController;
  final Color color;
  final bool readOnly; // Add readOnly field

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,width: 320,
      child: TextFormField(
        controller: searchController,
        readOnly: readOnly, // Add readOnly property
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: 'Search for Shops & Resturants',
          hintStyle: TextStyle(color: Colors.white, fontSize: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: color, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: color, width: 1.5),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          prefixIcon: Icon(Icons.search, color: Colors.white,),
        ),
      ),
    );
  }
}