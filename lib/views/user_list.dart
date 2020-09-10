import 'package:firecrud/components/user_tile.dart';
import 'package:firecrud/models/user.dart';
import 'package:firecrud/provider/users.dart';
import 'package:firecrud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de usuários'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
             Navigator.of(context).pushNamed(
               AppRoutes.USER_FORM
             );
            },
          )
        ],
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (context, index) =>
              UserTile(users.byIndex(index))),
    );
  }
}
