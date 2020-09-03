import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simpleFlutterCRUD/models/user.dart';
import 'package:simpleFlutterCRUD/provider/users_provider.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final _form = GlobalKey<FormState>();

  final Map<String, Object> _formData = {};

  void _loadFormData(User user) {
    if (user != null) {
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['profileURL'] = user.profileAvatar;
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context).settings.arguments as User;
    _loadFormData(user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _form.currentState.save();
              Navigator.of(context).pop();
              Provider.of<UsersProvider>(context, listen: false).put(
                User(
                  id: _formData['id'],
                  name: _formData['name'],
                  email: _formData['email'],
                  profileAvatar: _formData['profileURL'],
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                initialValue: _formData['name'],
                onSaved: (value) => _formData["name"] = value,
                decoration: InputDecoration(
                  labelText: "Name",
                ),
              ),
              TextFormField(
                initialValue: _formData['email'],
                onSaved: (value) => _formData["email"] = value,
                decoration: InputDecoration(
                  labelText: "E-mail",
                ),
              ),
              TextFormField(
                initialValue: _formData['profileURL'],
                onSaved: (value) => _formData["profileURL"] = value,
                decoration: InputDecoration(
                  labelText: "Avatar URL",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
