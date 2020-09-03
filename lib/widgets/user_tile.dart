import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleFlutterCRUD/Routes/app_routes.dart';
import 'package:simpleFlutterCRUD/models/user.dart';
import 'package:simpleFlutterCRUD/provider/users_provider.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.profileAvatar == null || user.profileAvatar.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.profileAvatar));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              color: Colors.orange,
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.USER_FORM,
                    arguments: user);
              },
            ),
            IconButton(
              color: Theme.of(context).errorColor,
              icon: Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Delete User"),
                    content: Text("Confirm deletion?"),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text("No"),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  ),
                ).then((confirmed) {
                  if (confirmed) {
                    Provider.of<UsersProvider>(context, listen: false)
                        .remove(user);
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
