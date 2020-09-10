import 'package:firecrud/models/user.dart';
import 'package:firecrud/routes/app_routes.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatar == null || user.avatar.isEmpty
        ? CircleAvatar(
            child: Icon(Icons.person),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          );
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: new Icon(
              Icons.edit,
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(
               AppRoutes.USER_FORM,
               arguments: user,
             );
            },
          ),
          IconButton(
            icon: new Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(12),
    );
  }
}
