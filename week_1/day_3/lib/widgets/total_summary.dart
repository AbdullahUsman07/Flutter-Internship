import 'package:day_3/widgets/quantity_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TotalSummary extends StatelessWidget {
  TotalSummary({super.key, required this.itemprice, this.platformfee = 14.99});
  
  final double itemprice;
  final double platformfee;

  @override
  Widget build(BuildContext context) {
    // Get controller instance with the same tag
    final QuantityController controller = Get.find<QuantityController>(tag: 'cart_controller');
    
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 230,
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Positioned(
            child: Text('Subtotal', style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ))),
          Positioned(
            top: 25,
            child: Text('Delivery Charges', style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w300,
          ))),
          Positioned(
            top: 60,
            child: Text('Apply a Voucher', style: TextStyle(
            color: Color.fromRGBO(255, 79, 0, 1),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ))),
          Positioned(
            top:90,
            child: Text('Platform Fee', style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ))),
          Positioned(
            right: 0,
            child: Obx(() =>
                  Text("Rs. ${itemprice * controller.selectedQuantity}",
                      style: TextStyle(color: Color.fromRGBO(255, 79, 0, 1),fontWeight: FontWeight.w600, fontSize: 18)))
          ),
          Positioned(
            right: 0,
            top:25,
            child: Text('Free', style: TextStyle(
            color: Color.fromRGBO(255, 79, 0, 1),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ))),
          Positioned(
            top:90,
            right: 0,
            child: Text(platformfee.toString(), style: TextStyle(
            color: Color.fromRGBO(255, 79, 0, 1),
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ))),
          Positioned(
              top: 180,
              left: 0,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextSpan(
                      text: '(incl. fee & tax)',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 79, 0, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 180,
              right: 0,
              child:Obx(() =>
                  Text("Rs. ${itemprice * controller.selectedQuantity + platformfee}",
                      style: TextStyle(color: Color.fromRGBO(255, 79, 0, 1),fontWeight: FontWeight.w600, fontSize: 18)))),
        ],
      ),
    );
  }
}