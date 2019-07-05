import 'dart:async';

import 'package:flutter/material.dart';
import 'package:music_player/music_player.dart';

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
      print("=======================");
      print(value);
    };
    musicPlayer.onCompleted = (){
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
                trackName: 'Sample',
                albumName: 'Sample Album',
                artistName: 'Sample Artist',
                url: 'http://listendata.ijsp.net/media/2/25/7754683.m4a',
                coverUrl: 'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
//              duration: Duration(seconds: 255),
              )),
              child: Text('Play'),
            ),

            RaisedButton(
              onPressed: (){
                musicPlayer.pause();
              },
              child: Text('暂停'),
            ),

            RaisedButton(
              onPressed: (){
                musicPlayer.seek(0.95);
              },
              child: Text('快进'),
            ),

            RaisedButton(
              onPressed: () => musicPlayer.play(MusicItem(
                trackName: 'Sample',
                albumName: 'Sample Album',
                artistName: 'Sample Artist',
                url: 'http://listendata.ijsp.net/media/2/25/7754453.m4a',
                coverUrl: 'http://img-tailor.11222.cn/pm/book/operate/2019011021053421.jpg',
//              duration: Duration(seconds: 255),
              )),
              child: Text('播放一个新的'),
            ),
          ],
        ),
      ),
    );
  }
}
