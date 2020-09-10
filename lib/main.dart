import 'package:firecrud/provider/users.dart';
import 'package:firecrud/routes/app_routes.dart';
import 'package:firecrud/views/user_form.dart';
import 'package:firecrud/views/user_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => new Users(),
        ),
      ],
      child: MaterialApp(
        title: 'Firecrud',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blue,
            visualDensity: VisualDensity.comfortable),
        routes: {
          AppRoutes.HOME: (_) => UserList(),
          AppRoutes.USER_FORM: (_) => UserForm()
        },
      ),
    );
  }
}
