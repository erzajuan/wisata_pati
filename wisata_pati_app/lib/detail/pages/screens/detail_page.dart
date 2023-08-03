import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/Template/view/spacer.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';
import 'package:wisata_pati_app/detail/bloc/detail_bloc.dart';
import 'package:wisata_pati_app/detail/bloc/detail_state.dart';
import 'package:wisata_pati_app/detail/models/datum/datum.dart';

import '../../../Template/constant/const_style.dart';

class DetailPage extends StatelessWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: TemplateScaffold(
        appBar: AppBar(
          title: const Text("Detail Wisata"),
        ),
        body: BlocBuilder<DetailBlocs, DetailState>(
          builder: (context, state) {
            if (state is DetailLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is DetailLoadedState) {
              List<Datum>? data = state.data;
              final List<String> imageList = data![index].imageUrl;
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              viewportFraction: 0.85,
                              enlargeCenterPage: true,
                              autoPlayCurve: Curves.easeInOutCubicEmphasized,
                              height:
                                  MediaQuery.of(context).size.height * 1 / 3),
                          items: imageList.map((imageURL) {
                            return InkWell(
                              onTap: () {
                                showImageViewer(
                                  context,
                                  Image.asset(imageURL).image,
                                  swipeDismissible: true,
                                  doubleTapZoomable: true,
                                  useSafeArea: true,
                                );
                              },
                              child: Builder(
                                builder: (BuildContext context) {
                                  return SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(18),
                                          bottomRight: Radius.circular(18)),
                                      child: Image.asset(
                                        imageURL,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        data[index].destinationName,
                                        style: ConstStyle.blackTextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () async {
                                            final url = data[index].map;
                                            final uri = Uri.parse(url);
                                            if (!await launchUrl(
                                              uri,
                                              mode: LaunchMode
                                                  .externalApplication,
                                            )) {
                                              throw Exception(
                                                  'Could not launch $uri');
                                            }
                                          },
                                          icon: const Icon(Icons.map))
                                    ],
                                  ),
                                  const VSpacer(8),
                                  SizedBox(
                                    width: ConstStyle.widthOfDevice(context),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          size: 18,
                                        ),
                                        Text(
                                          data[index].location,
                                          maxLines: 2,
                                        )
                                      ],
                                    ),
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
                                      margin: const EdgeInsets.only(
                                          left: 0, top: 18.0),
                                      child: Text(data[index].description,
                                          style: ConstStyle.blackTextStyle())),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: InkWell(
                        onTap: () {
                          context
                              .read<NavigatorBloc>()
                              .add(NavigateToVirtual(context, data[index]));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 60,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(18)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              const Expanded(
                                child: Text(
                                  "Virtual Tour",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
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
