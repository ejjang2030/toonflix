import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:toonflix/services/api_service.dart';

import '../models/webtoon_model.dart';
import '../widgets/webtoon_widget.dart';

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
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Expanded(
                      child: makeList(
                          snapshot as AsyncSnapshot<List<WebtoonModel>>)),
                ],
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

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    var list = snapshot.data!;
    return ListView.separated(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      separatorBuilder: (context, index) => const SizedBox(width: 40),
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (context, index) {
        print(index);
        var webtoon = list[index];
        return Webtoon(
            title: webtoon.title, thumb: webtoon.thumb, id: webtoon.id);
      },
    );
  }
}
