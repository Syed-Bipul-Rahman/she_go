import 'package:get/get.dart';

import '../../../../core/utils/app_image.dart';

class LocalDataController extends GetxController {
  String? selectedOption;
  List<Map<String, String>> joinOptions = [
    {
      "header": "User",
      "description": "Create your account User",
      "icon": AppImages.driverIcon,
    },
    {
      "header": "Driver",
      "description": "Create your account and\nBegin your journey",
      "icon": AppImages.userIcon,
    },
  ];
}
