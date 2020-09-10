import 'dart:math';

import 'package:firecrud/data/dummy_users.dart';
import 'package:firecrud/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  //Adiciona ou altera um usuário dentro do Map
  void put(User user) {
    if (user == null) {
      return;
    }

    if (user.id != null &&
        user.id.trim().isNotEmpty &&
        _items.containsKey(user.id)) {
      _items.update(user.id, (_) => user);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
          id,
          () => User(
              id: id, name: user.name, email: user.email, avatar: user.avatar));
    }
    notifyListeners();
  }

  void remove(User user) {
    if(user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
