import 'package:firecrud/models/user.dart';
import 'package:firecrud/provider/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatar'] = user.avatar;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final User user = ModalRoute.of(context).settings.arguments;
    _loadFormData(user);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário de usuário'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  avatar: _formData['avatar'],
                ));
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: new Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  initialValue: _formData['name'],
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Informe um nome válido';
                    }

                    if (value.trim().length < 3) {
                      return 'Nome muito pequeno. No mínimo 3 letras';
                    }

                    return null;
                  },
                  onSaved: (newValue) => _formData['name'] = newValue,
                ),
                TextFormField(
                  initialValue: _formData['email'],
                  decoration: InputDecoration(labelText: 'E-mail'),
                  onSaved: (newValue) => _formData['email'] = newValue,
                ),
                TextFormField(
                  initialValue: _formData['avatar'],
                  decoration: InputDecoration(labelText: 'URL do Avatar'),
                  onSaved: (newValue) => _formData['avatar'] = newValue,
                ),
              ],
            )),
      ),
    );
  }
}
