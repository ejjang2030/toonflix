import 'package:flutter/material.dart';
import 'package:toonflix/services/api_service.dart';

import '../models/webtoon_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: webtoons,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("There is data!");
            } else {
              return Text('Loading...');
            }
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
