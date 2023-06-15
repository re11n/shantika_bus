// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

class SelectedSeat extends GetxController {
  var indexKursi = 0.obs;

  var kursi = List.generate(
    2,
    (indexB) => List<Map<String, dynamic>>.generate(
      24,
      (indexK) {
        if (indexB == 0) {
          if (indexK >= 24 && indexK <= 26 || indexK >= 40 && indexK <= 44) {
            return {
              "id": "ID-${indexB + 1}-${indexK + 1}",
              "stat": "filled",
            };
          } else {
            return {
              "id": "ID-${indexB + 1}-${indexK + 1}",
              "stat": "available",
            };
          }
        } else {
          return {
            "id": "ID-${indexB + 1}-${indexK + 1}",
            "stat": "available",
          };
        }
      },
    ),
  ).obs;
}
