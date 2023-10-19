import 'package:ecommerce_admin/core/constant/app_image_asset.dart';
import 'package:ecommerce_admin/core/constant/routes.dart';
import 'package:ecommerce_admin/cubits/user%20cubit/user_cubit.dart';
import 'package:ecommerce_admin/view/widget/home/custom_card_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الصفحة الرئيسية")),
      body: ListView(
        children: [
          GridView(
            padding: const EdgeInsets.only(top: 10),
            physics:
                const NeverScrollableScrollPhysics(), // because we are in the list view
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.7, crossAxisCount: 3),
            children: [
              CustomHomeCard(
                  appImageAsset: AppImageAsset.logo,
                  text: "المستخدمين",
                  onTap: () {
                    context.read<UserCubit>().getUsers();
                    Get.toNamed(AppRoute.usersScreen);
                  }),
              CustomHomeCard(
                  appImageAsset: AppImageAsset.logo,
                  text: "المنتجات",
                  onTap: () {}),
              CustomHomeCard(
                  appImageAsset: AppImageAsset.logo,
                  text: "الأقسام",
                  onTap: () {}),
            ],
          )
        ],
      ),
    );
  }
}
