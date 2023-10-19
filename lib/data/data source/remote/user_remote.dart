import 'package:ecommerce_admin/core/api/crud.dart';
import 'package:ecommerce_admin/core/constant/app_links.dart';

class UserRemote {
  Crud crud;
  UserRemote(this.crud);
  getUsers() async {
    var response = await crud
        .getData(AppLinks.userLink);
    var resp = response.fold((l) => l, (r) => r);
    return resp;
  }
}
