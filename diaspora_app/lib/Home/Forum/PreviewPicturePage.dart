import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PreviewPicturePage extends StatefulWidget{

  var picture;
  PreviewPicturePage({required this.picture});

  @override
  State<PreviewPicturePage> createState() {
    return _PreviewPicturePage(picture: picture);
  }

}

class _PreviewPicturePage extends State<PreviewPicturePage>{


  var picture;
  _PreviewPicturePage({required this.picture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Preview"),),
      body: Container(
          child: PhotoView(
            imageProvider: NetworkImage( picture ),
          )
      ),
    );
  }
}