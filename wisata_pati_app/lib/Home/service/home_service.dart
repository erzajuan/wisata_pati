import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wisata_pati_app/detail/model/datum.dart';

class HomeService {
  String json = "assets/wisata.json";

  Future<List<Datum>?> readJson() async {
    String jsonData = await rootBundle.loadString(json);
    Map<String, dynamic> jsonMap = jsonDecode(jsonData);

    List<dynamic> jsonList = jsonMap['data'];
    List<Datum> destinationList =
        jsonList.map((item) => Datum.fromJson(item)).toList();

    return destinationList;
  }
}
