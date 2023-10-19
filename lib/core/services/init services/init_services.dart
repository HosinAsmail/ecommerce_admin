import 'package:ecommerce_admin/core/functions/firebase_functions.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_all_data.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_step_service.dart';
import 'package:ecommerce_admin/data/model/admin_model.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../../firebase_options.dart';

class InitServices {
  Future<void> init() async {
    // await StoreAllData().deleteDb();
    await StoreAllData().initializeDb();
    await StoreStepService().initSharedPreference();
    // StoreStepService().setStep('1');
    if (StoreStepService().getStep() == '2') {
      await AdminModel.init(await StoreAllData().readData('admin'));
    }
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    listenFirebase();
    await notificationPermission();
  }
}
