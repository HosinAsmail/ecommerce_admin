import 'package:ecommerce_admin/core/functions/my_snack_bar.dart';
import 'package:ecommerce_admin/cubits/user%20cubit/user_cubit.dart';
import 'package:ecommerce_admin/data/model/user_model.dart';
import 'package:ecommerce_admin/view/widget/users/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المستخدمين"),
      ),
      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is GetUserFailure) {
            mySnackBar(Colors.red, 'failure', state.errorMessage);
          }
        },
        buildWhen: (previous, current) {
          if (current is GetUserFailure ||
              current is GetUserLoading ||
              current is GetUserSuccess) {
            return true;
          } else {
            return false;
          }
        },
        builder: (context, state) {
          if (state is GetUserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<UserModel> users = context.read<UserCubit>().users;
            if (users.isNotEmpty) {
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    UserModel userModel = users[index];
                    return UserCard(userModel: userModel);
                  });
            } else {
              return const Text("empty");
            }
          }
        },
      ),
    );
  }
}
