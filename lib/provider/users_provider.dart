import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:simpleFlutterCRUD/data/dummy_users.dart';
import 'package:simpleFlutterCRUD/models/user.dart';

class UsersProvider with ChangeNotifier {
  Map<String, User> _items = {...DUMMY_USERS};

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(User user) {
    if (user == null) {
      return;
    }

    //edit user
    if (user.id.trim().isNotEmpty && _items.containsKey(user.id)) {
      _items.update(
        user.id,
        (_) => User(
          name: user.name,
          email: user.email,
          profileAvatar: user.profileAvatar,
          id: user.id,
        ),
      );
    } else {
      //add new user
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => User(
            id: id,
            name: user.name,
            email: user.email,
            profileAvatar: user.profileAvatar),
      );
    }
    notifyListeners();
  }

  //remove user
  void remove(User user) {
    if (user != null && user.id != null) {
      _items.remove(user.id);
      notifyListeners();
    }
  }
}
