import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MusicPlayer musicPlayer;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Initializing the Music Player and adding a single [PlaylistItem]
  Future<void> initPlatformState() async {
    musicPlayer = MusicPlayer();
    musicPlayer.onIsPaused = () {
      print('暂停');
    };
    musicPlayer.onPosition = (value) {
      print(value);
    };
    musicPlayer.onDuration = (value) {
      print(value);
    };
    musicPlayer.onCompleted = () {
      print("=====================");
      print("播放完成");
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Music Player example app'),
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
              onPressed: () => musicPlayer.play(MusicItem(
                  trackName: 'trackName',
                  //如果保持为空，锁屏控件将不显示
                  albumName: 'Sample Album',
                  artistName: 'Sample Artist',
                  url: 'https://s3.amazonaws.com/scifri-episodes/scifri20181123-episode.mp3',
                  coverUrl:
                  'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
//                  coverUrl:'',
                  cache: 'false'
//              duration: Duration(seconds: 255),
              )),
              child: Text('Play'),
            ),
            RaisedButton(
              onPressed: () {
                musicPlayer.pause();
              },
              child: Text('暂停'),
            ),
            RaisedButton(
              onPressed: () {
                musicPlayer.seek(0.95);
              },
              child: Text('快进'),
            ),
            RaisedButton(
              onPressed: () => musicPlayer.play(MusicItem(
                  trackName: '',
                  albumName: 'Sample Album',
                  artistName: 'Sample Artist',
                  url: 'http://listendata.ijsp.net/media/2/25/7754453.m4a',
                  coverUrl:
                  'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
                  cache: 'true'
//              duration: Duration(seconds: 255),
              )),
              child: Text('播放一个新的'),
            ),
            RaisedButton(
              onPressed: () async {
                var appDir1 = (await getApplicationDocumentsDirectory()).path;
                print(appDir1);
              },
              child: Text('路径'),
            ),
          ],
        ),
      ),
    );
  }
}
