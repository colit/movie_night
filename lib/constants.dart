import 'package:flutter/material.dart';

const kInputFieldStyle = InputDecoration(
  hintText: 'Enter film name',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.grey,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide.none,
  ),
);