import 'package:flutter/material.dart';
import 'package:simpleFlutterCRUD/Routes/app_routes.dart';
import 'package:simpleFlutterCRUD/provider/users_provider.dart';
import 'package:simpleFlutterCRUD/screens/user_form.dart';
import 'package:simpleFlutterCRUD/screens/user_list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider(),
      child: MaterialApp(
        title: 'Simple Flutter CRUD',
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.HOME: (context) => UserList(),
          AppRoutes.USER_FORM: (context) => UserForm()
        },
      ),
    );
  }
}
