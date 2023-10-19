import 'package:ecommerce_admin/core/constant/routes.dart';
import 'package:ecommerce_admin/core/middleware/my_middleware.dart';
import 'package:ecommerce_admin/view/screens/auth/login_screen.dart';
import 'package:ecommerce_admin/view/screens/home_screen.dart';
import 'package:ecommerce_admin/view/screens/language_screen.dart';
import 'package:ecommerce_admin/view/screens/users/order_user_archive.dart';
import 'package:ecommerce_admin/view/screens/users/users_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/",
      page: () => const LanguageScreen(),
      middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.loginScreen, page: () => const LoginScreen()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.usersScreen, page: () => const UsersScreen()),
  GetPage(
      name: AppRoute.orderUserArchiveScreen,
      page: () => const OrderUserArchiveScreen()),
];
