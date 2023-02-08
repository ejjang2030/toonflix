import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/webtoon_episode_model.dart';

class Episode extends StatelessWidget {
  const Episode({super.key, required this.episode, required this.webtoonId});

  final WebtoonEpisodeModel episode;
  final String webtoonId;

  onButtonTap() async {
    final Uri url = Uri.parse(
        'https://comic.naver.com/webtoon/detail?titleId=${this.webtoonId}&no=${episode.id}');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: onButtonTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green.shade400,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                episode.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
