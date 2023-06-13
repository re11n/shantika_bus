import 'package:get/get.dart';

class SelectSeatController extends GetxController {
  var indexBus = 0.obs;

  void reset() {
    bus.forEach((element) {
      element.forEach((element) {
        if (element["stat"] != "FIlled") {
          element.update("stat", (value) => "Available");
        }
      });
    });
  }

  void gantiBus(int indexBusGan) {
    indexBus.value = indexBusGan;
    bus.refresh();
  }

  String selectKursi(int indexKursiTerpilih) {
    print(bus[indexBus.value][indexKursiTerpilih]);
    if (bus[indexBus.value][indexKursiTerpilih]["stat"] == "Available") {
      reset();
      bus[indexBus.value][indexKursiTerpilih]
          .update("stat", (value) => "Selected");
    }
    bus.refresh();
    return bus[indexBus.value][indexKursiTerpilih]["id"];
  }

  var bus = List.generate(
      1,
      (indexB) => List<Map<String, dynamic>>.generate(24, (indexK) {
            if (indexB == 0) {
              return {
                "id": "ID-${indexB + 1}-${indexK + 1}",
                "stat": "Available"
              };
            } else {
              return {
                "id": "ID-${indexB + 1}-${indexK + 1}",
                "stat": "Available"
              };
            }
          })).obs;
}
