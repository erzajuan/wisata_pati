import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_state.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<DetailBlocs, DetailState>(
          builder: (context, state) {
            if (state is DetailLoadingState) {
              return const Center(child: Text("Loading"));
            }
            if (state is DetailLoadedState) {
              List<Datum>? data = state.data;
              final List<String> imageList = data![0].imageUrl;
              return Stack(children: [
                Column(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.85,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.easeInOutCubicEmphasized,
                          height: MediaQuery.of(context).size.height * 1 / 3),
                      items: imageList.map((imageURL) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(18),
                                    bottomRight: Radius.circular(18)),
                                child: Image.network(
                                  imageURL,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
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
                                data[0].destinationName,
                                style: const TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () async {
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
                                data[0].location,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 80,
                            height: 5,
                            color: Colors.black,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 18.0, top: 18.0),
                              child: Text(data[0].description))
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          const Icon(
                            Icons.vrpano,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          const Text(
                            "Virtual Tour",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                              onPressed: () {
                                //LINK
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]);
            }
            if (state is DetailErrorState) {
              return const Center(child: Text("Error"));
            }
            return const Center(child: Text("Error"));
          },
        ),
      ),
    );
  }
}
