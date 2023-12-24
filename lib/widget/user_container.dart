import 'package:flutter/material.dart';
import 'package:msib_suitmedia/models/users_model.dart';

class UserContainer extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const UserContainer({Key? key, required this.user, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
              radius: 20,
              child: user.avatar.isNotEmpty ? null : Text(user.firstName[0]),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${user.firstName} ${user.lastName}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(user.email,
                      style: TextStyle(fontSize: 14, color: Colors.grey)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
