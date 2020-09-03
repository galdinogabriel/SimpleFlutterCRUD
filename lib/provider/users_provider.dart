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
}
