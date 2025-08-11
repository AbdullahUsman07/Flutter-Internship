import 'package:day_3/pages/checkout_page.dart';
import 'package:day_3/pages/order_page.dart';
import 'package:day_3/widgets/calorie_info.dart';
import 'package:day_3/widgets/menu_component.dart';
import 'package:day_3/widgets/quantity_controller.dart';
import 'package:day_3/widgets/theme_creator.dart';
import 'package:day_3/widgets/total_summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            themeCreator(context),
            Positioned(
              left: 0,
              top: 80,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: StepProgressHeader(
                  currentStep: 2,
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
              top: 130,
              left: 30,
              child: itemImage('assets/images/burger.png'),
            ),
            Positioned(
              top: 165,
              left: 150,
              child: Text(
                'Master Biryani - Cantt',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 234,
              left: 114,
              child: Container(
                width: 180,
                height: 61,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromRGBO(255, 79, 0, 1),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(17),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Estimated Delivery Time',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 79, 0, 1),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      '30-40 mins',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 79, 0, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 320,
              left: 30,
              child: MenuComponent(showAddButton: false),
            ),
            Positioned(
              top: 370,
              left: 170,
              child: QuantityDropdown(controller: controller),
            ),
            Positioned(top: 320, right: 10, child: CalorieInfo()),
            Positioned(
              top: 470,
              left: 50,
              child: Text(
                'Add more items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 520, // Adjust based on your layout
              left: 0,
              child: TotalSummary(itemprice: MenuComponent().price_), // Remove Obx from here, let TotalSummary handle reactivity
            ),
            Positioned(
              top: 670,
              right: 1,
              left: 1,
              child: Divider(color: Colors.white, thickness: 1.5),
            ),
            Positioned(
              top: 770,
              left: 75,
              child: InkWell(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutPage()),
                  );
                },
                child: Container(
                  width: 239,height: 51,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 79, 0, 1)
                  ),
                  child: Center(
                    child: Text('Enter payment method & address', style: TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.w600),),
                  ),
                  ),
              )),
          ],
        ),
      ),
    );
  }
}

class StepProgressHeader extends StatelessWidget {
  final int currentStep; // 1 = menu, 2 = cart, 3 = checkout

  const StepProgressHeader({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    Color activeColor = const Color.fromRGBO(255, 79, 0, 1);
    Color inactiveColor = Colors.white;

    return SizedBox(
      height: 50, // enough for circles + labels
      child: LayoutBuilder(
        builder: (context, constraints) {
          double totalWidth = constraints.maxWidth;

          // Horizontal positions for each step
          double firstPos = totalWidth * 0.0;
          double secondPos = totalWidth * 0.5;
          // double thirdPos = totalWidth * 1.0; // Commented out unused variable

          // Active width calculation: goes exactly to the center of the current step
          double activeRightOffset;
          if (currentStep == 1) {
            activeRightOffset = totalWidth - firstPos;
          } else if (currentStep == 2) {
            activeRightOffset = totalWidth - secondPos;
          } else {
            activeRightOffset = 0; // full line
          }

          return Stack(
            alignment: Alignment.center,
            children: [
              // Background line (white) — full width
              Positioned(
                top: 14,
                left: 0,
                right: 0,
                child: Container(height: 2, color: inactiveColor),
              ),

              Positioned(
                top: 14,
                left: 0,
                right: activeRightOffset,
                child: Container(height: 2, color: activeColor),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  stepItem(
                    "1",
                    "menu",
                    currentStep >= 1,
                    activeColor,
                    inactiveColor,
                  ),
                  stepItem(
                    "2",
                    "cart",
                    currentStep >= 2,
                    activeColor,
                    inactiveColor,
                  ),
                  stepItem(
                    "3",
                    "checkout",
                    currentStep >= 3,
                    activeColor,
                    inactiveColor,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Widget stepItem(
    String number,
    String title,
    bool isActive,
    Color activeColor,
    Color inactiveColor,
  ) {
    return Column(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.black,
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? activeColor : activeColor,
              width: 2,
            ),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: isActive ? Colors.white : Color.fromRGBO(255, 79, 0, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }
}
