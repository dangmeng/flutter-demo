import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CameraPageState();

}

class _CameraPageState extends State {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('相机'),
          actions: <Widget>[
            new Container()
          ],
        ),
        body: new Center(
          child: null,
        ),
      ),

    );
  }
}