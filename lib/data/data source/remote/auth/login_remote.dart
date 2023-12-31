import 'package:ecommerce_admin/core/api/crud.dart';
import 'package:ecommerce_admin/core/constant/app_links.dart';

class LoginRemote {
  Crud crud;
  LoginRemote(this.crud);
  postData(String email, String password) async {
    var response = await crud
        .postData(AppLinks.loginLink, {"email": email, "password": password});
    var resp = response.fold((l) => l, (r) => r);
    return resp;
  }
}
