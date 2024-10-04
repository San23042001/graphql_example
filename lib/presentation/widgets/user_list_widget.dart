import 'package:flutter/material.dart';
import 'package:graphql_example/data/models/user_model.dart';

class UserListWidget extends StatelessWidget {
  final List<User> users;

  const UserListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
              // IconButton(
              //   icon: const Icon(Icons.delete),
              //   onPressed: () {
              //     context.read<UserCubit>().deleteUserAccount(user.id);
              //   },
              // ),
            ],
          ),
        );
      },
    );
  }
}
