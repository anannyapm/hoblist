import 'dart:convert';

import 'package:assignment/models/resultmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../models/moviemodel.dart';

Future<dynamic> sendPostRequest() async {
  final url = Uri.parse('https://hoblist.com/api/movieList');

  final response = await http.post(
    url,
    body: {
      'category': 'movies',
      'language': 'kannada',
      'genre': 'all',
      'sort': 'voting'
    },
  );
  if (response.statusCode == 200) {
    final data = ResultModel.fromJson(json.decode(response.body));
    
    return data;
    
  } else {
    return null;

    // Handle the response here
  }
}
