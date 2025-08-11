import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityController extends GetxController {
  var quantity = 1.obs; 
  double itemPrice = 300; 
  double platformFee = 14.49;
  double deliveryCharges = 0; 

  void setQuantity(int value) {
    quantity.value = value;
  }

  // ✅ Reactive getter for selected quantity
  int get selectedQuantity => quantity.value;

  // ✅ Subtotal (reactive)
  double get subtotal => itemPrice * selectedQuantity;

  // ✅ Total (reactive)
  double get totalWithFee => subtotal + platformFee + deliveryCharges;

}

class QuantityDropdown extends StatelessWidget {
  final QuantityController controller;
  final GlobalKey _key = GlobalKey();

  QuantityDropdown({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Color orangeBorder = const Color.fromRGBO(255, 79, 0, 1);

    return Obx(() {
      return GestureDetector(
        key: _key,
        onTap: () async {
          // 1️⃣ Get the widget position & size
          final RenderBox box =
              _key.currentContext!.findRenderObject() as RenderBox;
          final Offset position = box.localToGlobal(Offset.zero);
          final Size size = box.size;

          // 2️⃣ Show popup right below the container
          final selected = await showMenu<int>(
            context: context,
            position: RelativeRect.fromLTRB(
              position.dx,
              position.dy + size.height,
              position.dx + size.width,
              0,
            ),
            items: List.generate(10, (index) {
              int value = index + 1;
              return PopupMenuItem<int>(
                value: value,
                child: Text(value.toString()),
              );
            }),
          );

          // 3️⃣ Update quantity
          if (selected != null) {
            controller.setQuantity(selected);
          }
        },
        child: Container(
          width: 45,
          height: 24,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: orangeBorder, width: 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.quantity.value.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
              const SizedBox(width: 2),
              Icon(Icons.arrow_drop_down, size: 16, color: orangeBorder),
            ],
          ),
        ),
      );
    });
  }
}
