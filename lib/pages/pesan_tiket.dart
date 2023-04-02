import 'package:flutter/material.dart';

import 'package:get/get.dart';


class PesanTiket extends StatelessWidget{
   PesanTiket ({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 197, 202, 233),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: context.mediaQueryPadding.top),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Pilih Kursi",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333E63)
                      ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "New Shantika",
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                          Text(
                            "4676",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF333E63)
                            ),
                            )
                        ],
                      )
                  ],
                ),
              ),
            Column(
              children: [
                SizedBox(height: context.mediaQueryPadding.top),
                Container(
                  height: 50,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 30),
                        child: StatusKur(
                          status: "Avaiable",
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: StatusKur(
                          status: "Booked",
                          color: Color.fromARGB(255, 170, 168, 168),
                        ),
                      ),
                      StatusKur(
                        status: "Selected",
                        color: Colors.green,
                      ),                      
                    ],
                  ),
                ),
              ],            
            ),
            Column(children: [
              SizedBox(height : context.mediaQueryPadding.top),
              Stack(
                children:<Widget>[
                  Container( 
                   height: 490,
                   width: 500,
                    decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
                ),
                ),
                ]
              ),
            ],
            ),
          ],
        ),
        Column(
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:  45 , vertical: 250),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "A",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                      "B",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                       "C",
                        style: TextStyle(
                          fontSize: 18,
                           fontWeight: FontWeight.bold,
                        ),
                      ),
                        Text(
                        "D",
                         style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(width: 20,),
        Padding(
          padding: const EdgeInsets.only(top: 280),
          child: Container(
            child: GridView.count(
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              crossAxisCount: 4,
              children: List.generate(
                24, 
                (index) => Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black38,
                    ),
                    color: Colors.white,
                    borderRadius: 
                      BorderRadius.circular(10),
                  ),
                ),
                ), 
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 600),
          child: Container(
            child: Center(
              child: ElevatedButton(
                onPressed: () {}, 
                child: Text("PESAN"),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF656CEE),
                  fixedSize: Size(Get.width * 0.8, 50),
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

class StatusKur extends StatelessWidget {
  const StatusKur({
    super.key,
    required this.status,
    required this.color,
  });

  final String status;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
      ),                        
    ),
    SizedBox(width: 7),
    Text(
      status,
      style: TextStyle(
        fontSize: 18,
      ),
      )
      ],
    );
  }
}