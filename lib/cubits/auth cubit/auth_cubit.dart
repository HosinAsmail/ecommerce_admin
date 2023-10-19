import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin/data/model/admin_model.dart';
import 'package:ecommerce_admin/core/api/crud.dart';
import 'package:ecommerce_admin/core/functions/handling_failure_response.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_all_data.dart';
import 'package:ecommerce_admin/core/services/storage%20services/store_step_service.dart';
import 'package:ecommerce_admin/data/data%20source/remote/auth/login_remote.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Crud crud = Crud();
  AdminModel? adminModel;
  StoreAllData storeAllData = StoreAllData();
 
  void login(String email, String password) async {
    emit(LoginLoading());
    try {
      LoginRemote loginData = LoginRemote(crud);
      var response = await loginData.postData(email, password);
      if (response is Map<String, dynamic>) {
        await storeAllData.insertData('admin', response['data'][0]);
        await AdminModel.init(response['data']);
        adminModel = AdminModel.instance;
        StoreStepService().setStep("2");
      }
      String? authFailureMessage = handlingFailureMessage(
          response, "the email or the password is not correct");

      if (authFailureMessage != null) {
        emit(LoginFailure(errorMessage: authFailureMessage));
      } else {
        emit(LoginSuccess());
      }
    } on Exception catch (e) {
      if (e is ClientException) {
        emit(const LoginFailure(
            errorMessage: "the internet is slow, try again"));
      }
      emit(LoginFailure(errorMessage: "unknown problem : ${e.toString()} "));
    }
  }

}
