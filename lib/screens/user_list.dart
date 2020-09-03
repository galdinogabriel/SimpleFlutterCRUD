import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleFlutterCRUD/Routes/app_routes.dart';
import 'package:simpleFlutterCRUD/provider/users_provider.dart';
import 'package:simpleFlutterCRUD/widgets/user_tile.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("User List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (context, index) {
          return UserTile(users.byIndex(index));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.USER_FORM);
        },
      ),
    );
  }
}
