import 'package:firecrud/models/user.dart';
import 'package:firecrud/provider/users.dart';
import 'package:firecrud/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Excluir usuário'),
                  content: Text('Tem certeza?'),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text('Não'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Text('Sim'),
                    ),
                  ],
                ),
              ).then((value) {
                if (value) {
                  Provider.of<Users>(context, listen: false).remove(user);
                }
              });
            },
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(12),
    );
  }
}
