import 'package:get/get.dart';
import 'package:getx_restaurant/controllers/store_controller.dart';
import 'package:getx_restaurant/services/provider.dart';
import 'package:getx_restaurant/services/repository.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}
