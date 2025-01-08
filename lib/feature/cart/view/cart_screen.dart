import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wac_sports/core/extension/context.dart';
import 'package:wac_sports/feature/cart/view/widgets/order_details_tile.dart';
import 'package:wac_sports/feature/cart/view/widgets/remove_button_widget.dart';
import 'package:wac_sports/feature/cart/view/widgets/return_refund_policy_widget.dart';
import 'package:wac_sports/feature/cart/view/widgets/size_and_quantity_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.grey200,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.close),
        ),
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            10.verticalSpace,
            Container(
              height: 250,
              width: double.infinity,
              color: context.colors.surface,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 130.w,
                        height: 180,
                        child: Image.network(
                            'https://www.asics.co.in/media/catalog/product/1/0/1011b867_021_sr_rt_glb-base.jpg?optimize=high&bg-color=255%2C255%2C255&fit=cover&height=375&width=500&auto=webp&format=pjpg'),
                      ),
                      10.horizontalSpace,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          20.verticalSpace,
                          Text(
                            'Running Shoes',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[700]),
                          ),
                          Text(
                            'Womens Running Shoes',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          5.verticalSpace,
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return BottomSheet(
                                        onClosing: () {},
                                        builder: (context) {
                                          return SizedBox(
                                            height: 500,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  10.verticalSpace,
                                                  Row(
                                                    children: [
                                                      const Spacer(),
                                                      InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Icon(
                                                          CupertinoIcons
                                                              .clear_circled,
                                                          size: 29,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  const Text(
                                                    'Select Size',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 19),
                                                  ),
                                                  // 10.verticalSpace,
                                                  Expanded(
                                                    child: ListView.builder(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount: 5,
                                                        itemBuilder:
                                                            (context, index) {
                                                          return const Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8.0),
                                                            child: CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.grey,
                                                            ),
                                                          );
                                                        }),
                                                  ),
                                                  const Text(
                                                    'Select Size',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 19),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: const SizeAndQuantityCardWidget(
                                  title: 'Size',
                                  titleValue: '7',
                                ),
                              ),
                              10.horizontalSpace,
                              const SizeAndQuantityCardWidget(
                                title: 'Qty',
                                titleValue: '2',
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          const Text(
                            "\$399",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          3.verticalSpace,
                          Row(
                            children: [
                              Icon(Icons.replay_10_outlined,
                                  size: 17, color: Colors.grey[700]),
                              Text(
                                '10 day Return and Exchange',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[700]),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: context.grey200,
                  ),
                  5.verticalSpace,
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: RemoveButtonWidget(),
                    ),
                  ),
                  10.horizontalSpace
                ],
              ),
            ),
            15.verticalSpace,
            Text('Assure Quality | Easy Exchange',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.grey[700])),
            15.verticalSpace,
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.percent_rounded,
                          size: 18,
                        ),
                        5.horizontalSpace,
                        Text('Apply coupon',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[800],
                                fontSize: 17))
                      ],
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text('Select',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.blue[900])),
                    )
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            Container(
              // height: 300,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.verticalSpace,
                    const Text(
                      'Order Details',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    10.verticalSpace,
                    const OrderDetailsTile(
                      title: 'Bag Total',
                      value: '\$399',
                    ),
                    15.verticalSpace,
                    OrderDetailsTile(
                      title: 'Coupon savings',
                      value: 'ApplyCoupon',
                      onTap: () {},
                      valueStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blue[900]),
                    ),
                    15.verticalSpace,
                    const OrderDetailsTile(
                        title: 'Delivery Fee', value: '\$99'),
                    15.verticalSpace,
                    const OrderDetailsTile(
                      title: 'Platform Fee',
                      value: 'Free',
                      valueStyle: TextStyle(color: Colors.green),
                    ),
                    20.verticalSpace,
                    const OrderDetailsTile(
                      title: 'Amount Payable',
                      value: '\$498.00',
                      titleStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      valueStyle:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    10.verticalSpace
                  ],
                ),
              ),
            ),
            10.verticalSpace,
            const ReturnOrRefundPolicyWidget(),
            80.verticalSpace
          ],
        ),
      ),
      bottomSheet: Container(
        height: 70.h,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '\$498',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
                  ),
                  Text(
                    'View details',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.blue[900]),
                  )
                ],
              ),
              const CustomButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
      ),
      child: const Padding(
        padding: EdgeInsets.only(top: 12.0, right: 18, bottom: 12, left: 18),
        child: Text(
          'Add Address',
          style: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}
