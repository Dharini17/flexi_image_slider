import 'dart:async';
import 'package:flexi_image_slider/src/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

class Style3 extends StatelessWidget{

  final BuildContext context;
  bool autoScroll;
  final double aspectRatio;
  BoxFit boxFit;
  List<String> arrayImages;

  Style3({required this.context, required this.autoScroll, required this.aspectRatio, required this.boxFit,required this.arrayImages});

  Timer? _timer;
  final PageController _pageController = PageController(initialPage: 999,viewportFraction: 0.9);

  @override
  Widget build(BuildContext context) {

    if(autoScroll){
      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOutSine);
      });}

    return
      AspectRatio(
        aspectRatio: aspectRatio,
        child:
        PageView.builder(
          padEnds: true,
          controller: _pageController,

           itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child:
             InkWell(
             onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>
             gallery_zoom_slides(
             arrayImages: arrayImages,
             currentIndex: index%arrayImages.length)
             )),
             child:
              Utils.funcDisplayImage(arrayImages[index%arrayImages.length], boxFit),),
            );
          }
      ));
  }

}
