import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

import '../components/selected_seat.dart';

class SelectSeat extends GetView<SelectedSeat> {
  const SelectSeat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pilih Kursi'),
          leading: const BackButton(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 197, 202, 233),
        body: Stack(
          children: [
            // ignore: sized_box_for_whitespace
            Container(
              width: Get.width,
              height: Get.height,
            ),
            Column(
              children: [
                SizedBox(height: context.mediaQueryPadding.top),
                Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Pilih Kursi',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF333e63)),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'New Shantika',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF333e63)),
                          ),
                          Text(
                            'JetBus',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Status(
                        stat: 'Available',
                        color: Colors.white,
                      ),
                      Status(
                        stat: 'Filled',
                        color: Color.fromARGB(255, 162, 162, 158),
                      ),
                      Status(
                        stat: 'Selected',
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: const [
                              Text(
                                'A',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'B',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'D',
                                style: TextStyle(
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GridView.count(
                                    scrollDirection: Axis.vertical,
                                    padding: const EdgeInsets.all(10),
                                    mainAxisSpacing: 14,
                                    crossAxisSpacing: 16,
                                    crossAxisCount: 4,
                                    children: List.generate(
                                      24,
                                      (index) => Container(
                                        width: 50,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black26,
                                          ),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF656CEE),
                        fixedSize: Size(Get.width * 0.8, 50),
                      ),
                      child: const Text("PESAN"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class Status extends StatelessWidget {
  const Status({
    Key? key,
    required this.stat,
    required this.color,
  }) : super(key: key);

  final String stat;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(5)),
        ),
        const SizedBox(width: 7),
        Text(
          stat,
          style: const TextStyle(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
