import 'package:ecommerce_admin/data/model/admin_model.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:ecommerce_admin/core/constant/routes.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_all_data.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_step_service.dart';
import 'package:get/get.dart';

void logout() {
  StoreStepService().setStep('1');
  StoreAllData().deleteData('users');
  AdminModel adminModel = AdminModel.instance;
  FirebaseMessaging.instance.unsubscribeFromTopic("users");
  FirebaseMessaging.instance.unsubscribeFromTopic("admin${adminModel.adminId}");
  Get.offAllNamed(AppRoute.loginScreen);
}
