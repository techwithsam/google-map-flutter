import 'package:flutter/material.dart';

class SearchWidget {
  Widget search = Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(35),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[500]!.withOpacity(0.6),
          offset: Offset(1.0, 1.0),
          blurRadius: 6,
        ),
      ],
    ),
    child: TextFormField(
      enabled: true,
      decoration: InputDecoration(
        hintText: 'Search here',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(38)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        suffixIcon: Icon(Icons.keyboard_voice, size: 24),
        prefixIcon: Icon(Icons.location_on_rounded, size: 24),
      ),
    ),
  );
}
