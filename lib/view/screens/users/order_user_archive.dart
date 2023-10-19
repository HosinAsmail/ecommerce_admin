import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_admin/core/constant/app_color.dart';
import 'package:ecommerce_admin/core/functions/my_snack_bar.dart';
import 'package:ecommerce_admin/cubits/order%20cubit/order_cubit.dart';
import 'package:ecommerce_admin/data/model/order_model.dart';
import 'package:ecommerce_admin/view/widget/order/card_order.dart';
import 'package:get/get.dart';

class OrderUserArchiveScreen extends StatelessWidget {
  const OrderUserArchiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OrderCubit orderCubit = context.read<OrderCubit>();
    String userId = Get.arguments["userId"];
    orderCubit.archiveOrder(userId);

    return Scaffold(
        appBar: AppBar(
          title: const Text(" الأرشيف"),
          actions: [
            IconButton(
                onPressed: () {
                  orderCubit.archiveOrder(userId);
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            orderCubit.archiveOrder(userId);
          },
          child: BlocConsumer<OrderCubit, OrderState>(
            listener: (context, state) {
              if (state is ArchiveOrderFailure) {
                mySnackBar(Colors.red, 'failure', state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is ArchiveOrderLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<OrderModel> orders = orderCubit.archiveOrders;
                if (orders.isNotEmpty) {
                  return ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) {
                      return CardOrder(
                        orderModel: orders[index],
                      );
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Center(
                      child: Text(
                        "لا يوجد طلبات مسبقة حالياَ\n اذهب و أضف طلباتك",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: AppColor.black),
                      ),
                    ),
                  );
                }
              }
            },
          ),
        ));
  }
}
