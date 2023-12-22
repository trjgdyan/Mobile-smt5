import 'package:flutter/foundation.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api1/model/model.dart';

class Repository {
  String final_baseUr1 = "https://reqres.in/api/unknown";

  Future getData() async {
    try {
      http.Response response = await http.get(Uri.parse(final_baseUr1));

      print(response.body);
      print("masuk api");

      if (response.statusCode == HttpStatus.ok) {
        if (kDebugMode) {}
        //print(response.body);
        final jsonResponse = json.decode(response.body);
        final datablog = jsonResponse['data'];
        List blog = datablog.map((i) => Blog.fromJson(i)).toList();
        return blog;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
