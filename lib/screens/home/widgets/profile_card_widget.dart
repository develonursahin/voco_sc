import 'package:flutter/material.dart';
import 'package:voco_app/data/models/user_model.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(
          radius: 35,
          backgroundColor: Colors.deepPurple.shade300,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(userData.avatar),
          ),
        ),
        title: Text('${userData.firstName} ${userData.lastName}'),
        subtitle: Text(userData.email),
      ),
    );
  }
}
