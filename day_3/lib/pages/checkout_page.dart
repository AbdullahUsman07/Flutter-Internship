import 'package:day_3/pages/cart_screen.dart';
import 'package:day_3/widgets/order_summary.dart';
import 'package:day_3/widgets/quantity_controller.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final QuantityController controller;

  @override
  void initState() {
    super.initState();
    // Initialize controller once in initState with a unique tag
    controller = Get.put(QuantityController(), tag: 'cart_controller');
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    Get.delete<QuantityController>(tag: 'cart_controller');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          themeCreator(context),
          Positioned(
            left: 0,
            top: 80,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: StepProgressHeader(
                currentStep: 3,
              ), // Change number to test
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            left: 20,
            child: Image.asset(
              'assets/vectors/rectangle.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 20,
            left: 30,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
          Positioned(
            top: 32,
            left: 100,
            child: Text(
              'Cart',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
          Positioned(
            top: 190,
            left: 55,
            child: Container(
              width: 277,
              height: 92,
              decoration: BoxDecoration(color: Colors.white),
            ),
          ),
          Positioned(
            top: 170,
            left: 150,
            child: Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 90,
            child: Container(
              width: 217,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Color.fromRGBO(255, 79, 0, 1),
                  width: 2,
                ),
              ),
            ),
          ),
          Positioned(
            top: 294,
            left: 94,
            child: Text(
              'Delivery instructions / phone number  ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.w600,
                backgroundColor: Colors.black,
              ),
            ),
          ),
          Positioned(
            top: 290,
            left: 104,
            child: SizedBox(
              width: 190,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 79, 0, 1),
                      width: 1.5,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 79, 0, 1),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 410,
            left: 55,
            child: Container(
              width: 280,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Color.fromRGBO(255, 79, 0, 1),
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 20,
                    left: 70,
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 47,
                    left: 60,
                    child: Icon(
                      Icons.add,
                      color: Color.fromRGBO(255, 79, 0, 1),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 85,
                    child: Text(
                      'add a payment method',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 500, child: OrderSummary(itemprice: 300)),
          Positioned(
            top: 650,
            right: 1,
            left: 1,
            child: Divider(color: Colors.white, thickness: 1.5),
          ),
          Positioned(
            top: 750,
            left: 25,
            child: Text(
              'By completeing this order i agree to all terms & conditions',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Positioned(
            top: 790,
            left: 120,
            child: Container(
              width: 150,
              height: 40,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 79, 0, 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Place Order',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
