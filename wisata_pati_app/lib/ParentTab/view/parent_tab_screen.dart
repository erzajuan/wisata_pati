import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisata_pati_app/Navigation/bloc/navigator_bloc.dart';
import 'package:wisata_pati_app/ParentTab/bloc/parent_tab_bloc.dart';
import 'package:wisata_pati_app/Template/constant/const_style.dart';
import 'package:wisata_pati_app/Template/view/spacer.dart';
import 'package:wisata_pati_app/Template/view/template_scaffold.dart';
import 'package:wisata_pati_app/about/pages/AboutScreens.dart';
import 'package:wisata_pati_app/list_wisata/Pages/Screens/ListWisataScreens.dart';

class ParentTabScreen extends StatefulWidget {
  ParentTabScreen({super.key});

  @override
  State<ParentTabScreen> createState() => _ParentTabScreenState();
}

class _ParentTabScreenState extends State<ParentTabScreen>
    with SingleTickerProviderStateMixin {
  final List<Widget> _listPage = [
    const Placeholder(),
    const ListWisataScreens(),
    const AboutScreens(),
  ];

  final List<IconData> _icon = [
    Icons.location_on_outlined,
    Icons.home_outlined,
    Icons.info_outline,
  ];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3, initialIndex: 1);
    _tabController.animateTo(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: TemplateScaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          body: BlocBuilder<ParentTabBloc, int>(
            builder: ((context, indexActive) {
              return _listPage[indexActive];
            }),
          ),
          bottomNavigationBar: Container(
            height: 80,
            padding: const EdgeInsets.all(12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: ConstStyle.primaryColor,
                child: BlocBuilder<ParentTabBloc, int>(
                  builder: (context, indexActive) {
                    return TabBar(
                      controller: _tabController,
                      onTap: (index) => context
                          .read<ParentTabBloc>()
                          .add(ParentTabClicked(value: index)),
                      tabs: [
                        for (int i = 0; i < _icon.length; i++)
                          CustomBottomNavigationItem(
                              iconData: _icon[i],
                              index: i,
                              indexActive: indexActive)
                      ],
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide.none,
                      ),
                    );
                  },
                ),
              ),
            ),
          )),
    );
  }
}

class CustomBottomNavigationItem extends StatelessWidget {
  final IconData? iconData;
  final int index;
  final int indexActive;
  const CustomBottomNavigationItem({
    super.key,
    required this.index,
    required this.indexActive,
    this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),
      padding: const EdgeInsets.all(4),
      curve: Curves.fastOutSlowIn,
      decoration: indexActive != index
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
            ),
      child: Icon(
        iconData,
        size: 24,
        color: indexActive == index ? ConstStyle.secondaryColor : Colors.white,
      ),
    );
  }
}

Future<bool> onWillPop(BuildContext context) async {
  return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Keluar Aplikasi",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                const VSpacer(12),
                Text(
                  "Apakah Anda ingin keluar dari aplikasi?..",
                  style: ConstStyle.blackTextStyle(),
                ),
                const VSpacer(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => context
                          .read<NavigatorBloc>()
                          .add(NavigatePop(context)),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => exit(0),
                      child: const Text('Ya'),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
      ) ??
      false;
}
