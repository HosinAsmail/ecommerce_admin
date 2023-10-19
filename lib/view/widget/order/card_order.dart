import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ecommerce_admin/core/constant/app_color.dart';
import 'package:ecommerce_admin/core/constant/routes.dart';
import 'package:ecommerce_admin/core/functions/alert_dialog.dart';
import 'package:ecommerce_admin/core/functions/get_order_details.dart';
import 'package:ecommerce_admin/cubits/order%20cubit/order_cubit.dart';
import 'package:ecommerce_admin/data/model/order_model.dart';
import 'package:ecommerce_admin/view/widget/order/description_order.dart';

class CardOrder extends StatelessWidget {
  const CardOrder({
    super.key,
    required this.orderModel,
  });
  final OrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DescriptionOrder(
                    title: "رقم الطلب:   ",
                    value: "${orderModel.ordersId}#",
                  ),
                  DescriptionOrder(
                      title: "طريقة الدفع:   ",
                      value: getPaymentMethod(orderModel.ordersPaymentmethod!)),
                  DescriptionOrder(
                      title: "نوع الطلب:   ",
                      value: getOrderType(orderModel.ordersType!)),
                  DescriptionOrder(
                      title: "سعر المنتجات:   ",
                      value: "${orderModel.ordersAllprodcutsprice}\$"),
                  DescriptionOrder(
                      title: "تكلفة التوصيل:   ",
                      value: "${orderModel.ordersPricedelivery}\$"),
                  DescriptionOrder(
                      title: "السعر الكلي:   ",
                      value: "${orderModel.ordersTotalPrice}\$"),
                  Row(
                    children: [
                      const Text(
                        "حالة الطلب:   ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        getOrderState(orderModel.ordersState!),
                        style: const TextStyle(
                            fontSize: 18,
                            color: AppColor.successColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      // if (orderModel.ordersState == 'none')
                      //   TextButton(
                      //     onPressed: () {
                      //       alertDialog(
                      //           context: context,
                      //           title: "تحذير",
                      //           content: "هل أنت متأكد من حذف هذا الطلب؟",
                      //           confirmText: "نعم",
                      //           onPressed: () {
                      //             context
                      //                 .read<OrderCubit>()
                      //                 .deleteOrder(orderModel);
                      //             Get.back();
                      //           });
                      //     },
                      //     child: const Text(
                      //       "حذف",
                      //       style: TextStyle(color: Colors.red),
                      //     ),
                      //   ),
                      // MaterialButton(
                      //   color: AppColor.secondaryColor,
                      //   onPressed: () {
                      //     context
                      //         .read<OrderCubit>()
                      //         .orderDetails(orderModel.ordersId);
                      //     Get.toNamed(AppRoute.detailOrderScreen,
                      //         arguments: {"orderModel": orderModel});
                      //   },
                      //   child: const Text("التفاصيل"),
                      // )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (orderModel.ordersState == 'none')
                        TextButton(
                          onPressed: () {
                            alertDialog(
                                context: context,
                                title: "تحذير",
                                content: "هل أنت متأكد من حذف هذا الطلب؟",
                                confirmText: "نعم",
                                onPressed: () {
                                  context
                                      .read<OrderCubit>()
                                      .deleteOrder(orderModel);
                                  Get.back();
                                });
                          },
                          child: const Text(
                            "حذف",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      MaterialButton(
                        color: AppColor.secondaryColor,
                        onPressed: () {
                          context
                              .read<OrderCubit>()
                              .orderDetails(orderModel.ordersId);
                          Get.toNamed(AppRoute.detailOrderScreen,
                              arguments: {"orderModel": orderModel});
                        },
                        child: const Text("التفاصيل"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 5,
              top: 3,
              child: Text(Jiffy.parse(orderModel.ordersDatetime!).fromNow()))
        ],
      ),
    );
  }
}
