import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReturnOrRefundPolicyWidget extends StatelessWidget {
  const ReturnOrRefundPolicyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            const Text(
              'Return/Refund policy',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            10.verticalSpace,
            const Text(
                'In case of return, we ensure quick refunds. Full amount will be refunded excluding Conveinience Fee'),
            15.verticalSpace,
            InkWell(
              onTap: () {},
              child: Text(
                'Read policy',
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: Colors.blue[900]),
              ),
            ),
            10.verticalSpace
          ],
        ),
      ),
    );
  }
}