import 'package:flutter/material.dart';
class ImageViewPage extends StatelessWidget {
  ImageViewPage({Key key, this.path}) : super(key : key );
  final String path;
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('이미지보기'),
        ),
        body: Center (
          child: Image.network(this.path)
        )
    );
  }
}
