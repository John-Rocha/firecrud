import 'package:firecrud/views/user_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.green[200]),
    home: UserList(),
  ));
}
