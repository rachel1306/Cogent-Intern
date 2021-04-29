import 'package:flutter/material.dart';

class ImageSwipe extends StatefulWidget {
  final List imageList;
  ImageSwipe({this.imageList});
  @override
  _ImageSwipeState createState() => _ImageSwipeState();
}

class _ImageSwipeState extends State<ImageSwipe> {
  int _isSelected=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              PageView(
                onPageChanged: (num){
                  setState(() {
                    _isSelected=num;
                  });
                },
                children: [
                  for(var i = 0; i < widget.imageList.length; i++)
                    Container(
                      child: Image.network("${widget.imageList[i]}",
                        fit: BoxFit.cover,),
                    ),
                ],
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i=0;i<widget.imageList.length;i++)
                      if(widget.imageList.length >1)
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: _isSelected==i ? 15 : 8,
                        height: 5,
                        color: Colors.white,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}