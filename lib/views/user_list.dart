import 'package:firecrud/components/user_tile.dart';
import 'package:firecrud/data/dummy_users.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  final users = {...DUMMY_USERS};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) =>
              UserTile(users.values.elementAt(index))),
    );
  }
}
