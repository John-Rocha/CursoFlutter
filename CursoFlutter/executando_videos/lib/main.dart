import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() => runApp(MaterialApp(
  home: Home(),
  debugShowCheckedModeBanner: false,
));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  VideoPlayerController _videoPlayerController;
  
  @override
  void initState() {
    super.initState();
    VideoPlayerController.network(
      ""
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
