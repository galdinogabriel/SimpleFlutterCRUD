import 'package:flutter/material.dart';
import 'package:simpleFlutterCRUD/widgets/user_tile.dart';
import '../data/dummy_users.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = {...DUMMY_USERS};
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return UserTile(users.values.elementAt(index));
        },
      ),
    );
  }
}
