import 'package:bloc/bloc.dart';
import 'package:ecommerce_admin/core/api/crud.dart';
import 'package:ecommerce_admin/core/functions/check_internet_function.dart';
import 'package:ecommerce_admin/core/functions/handling_failure_response.dart';
import 'package:ecommerce_admin/data/data%20source/remote/user_remote.dart';
import 'package:ecommerce_admin/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Crud crud = Crud();
  List<UserModel> users = [];

  void getUsers() async {
    emit(GetUserLoading());
    if (await checkInternetFunction()) {
      if (users.isEmpty) {
        try {
          UserRemote userRemote = UserRemote(crud);
          var response = await userRemote.getUsers();
          if (response is Map<String, dynamic>) {
            users.clear();
            for (final user in response['data']) {
              users.add(UserModel.fromJson(user));
            }
          }
          String? failureMessage = handlingFailureMessage(response, "no data");
          if (failureMessage != null) {
            emit(GetUserFailure(errorMessage: failureMessage));
          } else {
            emit(GetUserSuccess());
          }
        } on Exception catch (e) {
          print(e);
          if (e is ClientException) {
            emit(const GetUserFailure(
                errorMessage: "the internet is slow, try again"));
          }
          emit(GetUserFailure(
              errorMessage: "unknown problem : ${e.toString()} "));
        }
      } else {
        emit(GetUserSuccess());
      }
    } else {
      emit(const GetUserFailure(
          errorMessage:
              "your offline, please turn on the internet and try again"));
    }
  }
}
