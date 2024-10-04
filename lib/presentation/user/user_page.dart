import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/domain/entities/params/create_user_params.dart';
import 'package:graphql_example/domain/entities/params/delete_user_params.dart';
import 'package:graphql_example/presentation/cubit/user_cubit/user_cubit.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            onPressed: () =>
                _showCreateUserDialog(context, nameController, emailController),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  trailing: IconButton(
                    onPressed: () => context.read<UserCubit>().deleteUser(
                        deleteUserParams: DeleteUserParams(id: user.id)),
                    icon: const Icon(Icons.delete),
                  ),
                );
              },
            );
          } else if (state is UserErrorState) {
            return Center(child: Text(state.error.errorMessage));
          } else if (state is UserLoadedState && state.users.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          return const Center(child: Text('No users found'));
        },
      ),
    );
  }

  void _showCreateUserDialog(
      BuildContext context,
      TextEditingController nameController,
      TextEditingController emailController) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create User'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<UserCubit>().createUser(
                    createUserParams: CreateUserParams(
                        name: nameController.text,
                        email: emailController.text));
                nameController.clear();
                emailController.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
