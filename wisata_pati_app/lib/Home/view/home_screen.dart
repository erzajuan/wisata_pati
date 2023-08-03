import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Home/bloc/home_bloc.dart';
import 'package:wisata_pati_app/Template/constant/const_style.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';
import 'package:wisata_pati_app/detail/model/datum.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplateScaffold(
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadFailure) {
            return Center(
              child: Text(
                state.message,
                style: ConstStyle.blackTextStyle(),
              ),
            );
          } else if (state is HomeLoadSuccess) {
            return Center(
              child: ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  List<Datum>? data = state.data;
                  final List<String> imageList = data[index].imageUrl;
                  return InkWell(
                    onTap: () {},
                    child: Card(
                      borderOnForeground: true,
                      shadowColor: Colors.blue,
                      surfaceTintColor: Colors.green,
                      elevation: 5,
                      color: const Color(0x00d2dbea),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.network(
                                imageList[0],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Text(data[index].destinationName),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
