import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String destinationName;
  final String description;
  final String imageUrl;
  final String location;

  const DetailPage({
    super.key,
    required this.destinationName,
    required this.description,
    required this.imageUrl,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Image.asset(
                "assets/images/image3.jpg",
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 1 / 3,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            destinationName,
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {
                                // LINK
                              },
                              icon: const Icon(Icons.map))
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 18,
                          ),
                          Text(
                            location,
                          )
                        ],
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 18.0, top: 18.0),
                          child: Text(description))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
