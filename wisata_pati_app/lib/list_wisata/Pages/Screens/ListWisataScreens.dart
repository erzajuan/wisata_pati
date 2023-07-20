import 'package:flutter/material.dart';

class ListWisataScreens extends StatelessWidget {
  const ListWisataScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List Wisata")),
      body: Center(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              borderOnForeground: true,
              shadowColor: Colors.black,
              // surfaceTintColor: Colors.black,
              // color: const Color(#193D7033),
              //color #193D7033
              color: const Color(0x00d2dbea),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),

              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              "https://www.tripsavvy.com/thmb/lMkxZbsOt3L4co9_tUgsOHl9Vok=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/gunung-bromo-volcano-indonesia-108224973-5a7ebe0d6bf0690037337d61.jpg",
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: ClipRRect(
                            // borderRadius: BorderRadius.circular(40),
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(30)),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.075,
                              width: MediaQuery.of(context).size.width * 0.5,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/bg_diskon.png"),
                                  fit: BoxFit.fill,
                                ),
                                // color: Colors.orange,
                                borderRadius: BorderRadius.only(
                                  // topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                              child: const Text(
                                "Save 20%",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 16,
                    ),
                    Text("Gunung Bromo"),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
