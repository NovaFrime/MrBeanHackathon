import 'package:flutter/material.dart';
import 'package:mrbean/screens/authenticate/authenticate.dart';
import 'package:mrbean/models/user.dart';
import 'package:mrbean/screens/widgets/home_widget.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    print(user);
    if (user == null || user.uid == null){
      return Authenticate();
    } else {
      return Home();
    }

  }
}