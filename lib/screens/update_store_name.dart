import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_restaurant/controllers/store_controller.dart';
import 'package:getx_restaurant/widgets/rounded_input.dart';

class UpdateStoreName extends StatelessWidget {
  UpdateStoreName({Key? key}) : super(key: key);
  final storeController = Get.find<StoreController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Update Store Name")),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Enter Store Name",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
            const SizedBox(height: 16),
            RoundedInput(
              hintText: "Store Name",
              controller: storeController.storeNameEditingController,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                storeController.updateStoreName(
                    storeController.storeNameEditingController.text);
                Get.snackbar(
                    'Updated',
                    'Store name has been updated to\n '
                        '${storeController.storeNameEditingController.text}',
                    snackPosition: SnackPosition.BOTTOM);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
