import 'dart:math';

import 'package:assignment/main.dart';
import 'package:assignment/models/resultmodel.dart';

import 'package:assignment/view/login.dart';
import 'package:assignment/view/widgets/moviecard.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../services/base_client.dart';

ResultModel? movielist;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: sendPostRequest(),
      builder: (context, snapshot) {
        return ListView.separated(
          separatorBuilder: ((context, index) => Divider()),
          itemBuilder: (context, index) {
            return MovieCard(movieobject: snapshot.data.results[index]);
           
          },
          itemCount: snapshot.data.results.length,
        );
      },
    )

        /* Column(
      children: [
        Text("API DATA"),
        ElevatedButton(
            onPressed: () => signOut(context), child: Text("logout")),
        ElevatedButton(
            onPressed: () async {
              movielist = await sendPostRequest();
             
              print(movielist?.results[0].title);
            },
            child: Text("post")),
      ],
    ) */
        );
  }

  signOut(BuildContext ctx) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();

    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => ScreenLogin()), (route) => false);
  }
}
