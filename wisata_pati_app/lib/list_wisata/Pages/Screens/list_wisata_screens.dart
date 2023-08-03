import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Template/constant/const_style.dart';

import '../../../Navigation/bloc/navigator_bloc.dart';
import '../../../detail/models/datum/datum.dart';
import '../../bloc/list_wisata_bloc.dart';
import '../../bloc/list_wisata_event.dart';
import '../../bloc/list_wisata_state.dart';

class ListWisataScreens extends StatefulWidget {
  const ListWisataScreens({Key? key}) : super(key: key);

  @override
  State<ListWisataScreens> createState() => _ListWisataScreensState();
}

class _ListWisataScreensState extends State<ListWisataScreens> {
  @override
  initState() {
    super.initState();
    context.read<ListWisataBlocs>().add(ListWisataLoadEvents());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ListWisataBlocs, ListWisataState>(
        builder: (context, state) {
          if (state is ListWisataLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ListWisataLoadedState) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) {
                List<Datum>? data = state.data;
                final List<String> imageList = data![index].imageUrl;
                return Container(
                  margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: InkWell(
                    onTap: () {
                      context
                          .read<NavigatorBloc>()
                          .add(NavigateToDetailWisata(context, index));
                    },
                    child: Card(
                      shadowColor: Colors.black54,
                      clipBehavior: Clip.antiAlias,
                      elevation: 2,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      surfaceTintColor: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 10,
                                      offset: Offset(0, 12)),
                                ],
                              ),
                              child: ClipRRect(
                                clipBehavior: Clip.antiAlias,
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  imageList[0],
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                margin: const EdgeInsets.only(left: 8),
                                child: Text(
                                  data[index].destinationName,
                                  style: ConstStyle.blackTextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
