import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart';
import 'package:ecommerce_admin/core/api/crud.dart';
import 'package:ecommerce_admin/core/functions/check_internet_function.dart';
import 'package:ecommerce_admin/core/functions/handling_failure_response.dart';
import 'package:ecommerce_admin/data/data%20source/remote/order_remote.dart';
import 'package:ecommerce_admin/data/model/cart_model.dart';
import 'package:ecommerce_admin/data/model/order_model.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  Crud crud = Crud();
  OrderCubit() : super(OrderInitial());
  // late String addressId;
  List<OrderModel> pendingOrders = [];
  List<OrderModel> archiveOrders = [];

  List<CartModel> products = [];

  // void pendingOrder() async {
  //   if (await checkInternetFunction()) {
  //     emit(PendingOrderLoading());
  //     try {
  //       OrderRemote orderRemote = OrderRemote(crud);
  //       var response = await orderRemote.pendingOrder(userModel.userId);

  //       if (response is Map<String, dynamic>) {
  //         pendingOrders.clear();
  //         for (final order in response["data"]) {
  //           pendingOrders.add(OrderModel.fromJson(order));
  //         }
  //       }
  //       String? failureMessage =
  //           handlingFailureMessage(response, "failed no data!");
  //       if (failureMessage != null) {
  //         pendingOrders.clear();
  //         emit(PendingOrderFailure(errorMessage: failureMessage));
  //       } else {
  //         emit(PendingOrderSuccess());
  //       }
  //     } on Exception catch (e) {
  //       if (e is ClientException) {
  //         emit(const PendingOrderFailure(
  //             errorMessage: "the internet is slow, try again"));
  //       }
  //       emit(PendingOrderFailure(
  //           errorMessage: "unknown problem : ${e.toString()} "));
  //     }
  //   } else {
  //     emit(const PendingOrderFailure(
  //         errorMessage: "the internet is slow, try again"));
  //   }
  // }

  void archiveOrder(String userId) async {
    if (await checkInternetFunction()) {
      emit(ArchiveOrderLoading());
      try {
        OrderRemote orderRemote = OrderRemote(crud);
        var response = await orderRemote.archiveOrder(userId);

        if (response is Map<String, dynamic>) {
          archiveOrders.clear();
          for (final order in response["data"]) {
            archiveOrders.add(OrderModel.fromJson(order));
          }
        }
        String? failureMessage =
            handlingFailureMessage(response, "failed no data!");
        if (failureMessage != null) {
          pendingOrders.clear();
          emit(ArchiveOrderFailure(errorMessage: failureMessage));
        } else {
          emit(ArchiveOrderSuccess());
        }
      } on Exception catch (e) {
        if (e is ClientException) {
          emit(const ArchiveOrderFailure(
              errorMessage: "the internet is slow, try again"));
        }
        emit(ArchiveOrderFailure(
            errorMessage: "unknown problem : ${e.toString()} "));
      }
    } else {
      emit(const ArchiveOrderFailure(
          errorMessage: "the internet is slow, try again"));
    }
  }

  void orderDetails(ordersId) async {
    if (await checkInternetFunction()) {
      emit(OrderDetailsLoading());
      try {
        OrderRemote orderRemote = OrderRemote(crud);
        var response = await orderRemote.detailsOrder(ordersId);

        if (response is Map<String, dynamic>) {
          products.clear();
          for (final product in response["data"]) {
            products.add(CartModel.fromJson(product));
          }
        }
        String? failureMessage =
            handlingFailureMessage(response, "failed no data!");
        if (failureMessage != null) {
          emit(OrderDetailsFailure(errorMessage: failureMessage));
        } else {
          emit(OrderDetailsSuccess());
        }
      } on Exception catch (e) {
        if (e is ClientException) {
          emit(const OrderDetailsFailure(
              errorMessage: "the internet is slow, try again"));
        }
        emit(OrderDetailsFailure(
            errorMessage: "unknown problem : ${e.toString()} "));
      }
    } else {
      emit(const OrderDetailsFailure(
          errorMessage: "the internet is slow, try again"));
    }
  }

  void deleteOrder(OrderModel orderModel) async {
    if (await checkInternetFunction()) {
      emit(DeleteOrderLoading());
      try {
        OrderRemote orderRemote = OrderRemote(crud);
        var response = await orderRemote.deleteOrder(orderModel.ordersId!);
        String? failureMessage =
            handlingFailureMessage(response, "failed to delete data!");
        if (failureMessage != null) {
          emit(DeleteOrderFailure(errorMessage: failureMessage));
        } else {
          pendingOrders.remove(orderModel);
          emit(DeleteOrderSuccess());
        }
      } on Exception catch (e) {
        if (e is ClientException) {
          emit(const DeleteOrderFailure(
              errorMessage: "the internet is slow, try again"));
        }
        emit(DeleteOrderFailure(
            errorMessage: "unknown problem : ${e.toString()} "));
      }
    } else {
      emit(const DeleteOrderFailure(
          errorMessage: "the internet is slow, try again"));
    }
  }
}
