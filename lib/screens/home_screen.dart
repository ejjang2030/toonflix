import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toonflix/services/api_service.dart';

import '../models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var list = snapshot.data! as List<WebtoonModel>;
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(width: 20),
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  print(index);
                  var webtoon = list[index];
                  return Text(webtoon.title);
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: Text(
          '오늘의 웹툰',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
