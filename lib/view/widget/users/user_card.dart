import 'package:ecommerce_admin/core/constant/app_color.dart';
import 'package:ecommerce_admin/core/constant/routes.dart';
import 'package:ecommerce_admin/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.userModel,
  });

  final UserModel userModel;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      // onTap: () {
      //   print("--------------------");
      //   print(userModel.usersId);
      //   print("--------------------");
      //   Get.toNamed(AppRoute.orderUserArchiveScreen,
      //       arguments: {"userId": userModel.usersId});
      // },
      // leading: Container(
      //   height: 200,
      //   width: 100,
      //   decoration: BoxDecoration(
      //       color: AppColor.secondaryColor,
      //       borderRadius: BorderRadius.circular(10)),
      //   child: SvgPicture.network(
      //     "${AppLinks.imageUserLink}/${UserModel.UserImage}",
      //     height: 200,
      //     width: 100,
      //   ),
      // ),
      trailing: MaterialButton(
        onPressed: () {
          print("--------------------");
          print(userModel.usersId);
          print("--------------------");

          Get.toNamed(AppRoute.orderUserArchiveScreen,
              arguments: {"userId": userModel.usersId});
        },
        textColor: Colors.white,
        color: AppColor.primaryColor,
        child: const Text("طلبات"),
      ),

      title: Text(userModel.usersName!),
      subtitle: Text(
          "رقم الهاتف:  ${userModel.usersPhone!} \n${userModel.usersEmail!}"),
    ));
  }
}
