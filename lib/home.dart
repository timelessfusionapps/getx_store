import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_restaurant/app_theme.dart';
import 'package:getx_restaurant/constants/color_constants.dart';
import 'package:getx_restaurant/controllers/store_controller.dart';
import 'package:getx_restaurant/controllers/theme_controller.dart';
import 'package:getx_restaurant/widgets/card_main.dart';
import 'package:getx_restaurant/widgets/side_drawer.dart';

class Home extends GetView<StoreController> {
  Home({Key? key}) : super(key: key);
  final themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.spaceCadet,
      appBar: AppBar(
        title: const Text("GetX Store"),
        actions: [
          IconButton(
            onPressed: () {
              if (Get.isDarkMode) {
                themeController.changeTheme(Themes.lightTheme);
                themeController.saveTheme(false);
              } else {
                themeController.changeTheme(Themes.darkTheme);
                themeController.saveTheme(true);
              }
            },
            icon: Get.isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MainCard(
                title: "Store Info",
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Store Name:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with Obx to observe changes to the storeName
                        // variable when called using the StoreController.
                        Obx(
                          () => Flexible(
                            child: Text(
                              // value parameter to be added with Obx or GetX
                              controller.storeName.value.toString(),
                              style: const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            fit: FlexFit.tight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Store Followers:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20.0),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('With Obx'),
                              Obx(
                                () => Text(
                                  controller.followerCount.value.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: Column(
                            children: [
                              const Text('With GetBuilder'),
                              GetBuilder<StoreController>(
                                builder: (newController) => Text(
                                  // value parameter is not needed with GetBuilder
                                  newController.storeFollowerCount.toString(),
                                  textAlign: TextAlign.start,
                                  style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Wrapped with GetBuilder to observe changes to the followerCount
                        // variable when called using the StoreController.
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Flexible(
                          child: Text(
                            'Status:',
                            style: TextStyle(fontSize: 20),
                          ),
                          fit: FlexFit.tight,
                        ),
                        const SizedBox(width: 20.0),
                        // Wrapped with GetX<StoreController> to observe changes to the storeStatus
                        // variable when called using the StoreController.
                        GetX<StoreController>(
                          builder: (sController) => Flexible(
                            child: Text(
                              sController.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: sController.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            fit: FlexFit.tight,
                          ),
                        ),
                        /*Obx(
                          () => Flexible(
                            child: Text(
                              controller.storeStatus.value ? 'Open' : 'Closed',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: controller.storeStatus.value
                                      ? Colors.green.shade700
                                      : Colors.red,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                            fit: FlexFit.tight,
                          ),
                        ),*/
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              MainCard(
                  title: "Followers",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.followerList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          child: Text(
                            controller.followerList[index].toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                          padding: const EdgeInsets.all(8),
                        );
                      },
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              MainCard(
                  title: "Reviews",
                  body: Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.reviews.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(controller.reviews[index].name),
                          subtitle: Text(controller.reviews[index].review),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
