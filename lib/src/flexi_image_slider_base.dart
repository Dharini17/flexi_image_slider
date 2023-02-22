import 'dart:async';
import 'package:flexi_image_slider/src/Style1.dart';
import 'package:flexi_image_slider/src/Style2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'Style3.dart';

//https://stackoverflow.com/questions/63010195/flutter-fade-animation-between-page-views

/// Checks if you are awesome. Spoiler: you are.
class flexi_image_slider extends StatelessWidget{

  final enumStyle style;
  final BuildContext context;
  bool? isAutoScroll;
  final double aspectRatio;
  bool? isDotsIndicatorDisplay;
  int? itemCount;
  NullableIndexedWidgetBuilder? itemBuilder;
  List<Widget>? arrayItems;

  //-----------------------

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0,);

  int _currentPage = 0;

   flexi_image_slider({
     super.key,
     required this.style,
     required this.context,
     this.isAutoScroll,
     required this.aspectRatio,
     this.isDotsIndicatorDisplay,
     this.itemCount,
     this.itemBuilder,
     this.arrayItems
   });

  static CachedNetworkImage funcDisplayImage(String strImageURL, BoxFit varBoxType) {

    return CachedNetworkImage(
      imageUrl: "$strImageURL",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: varBoxType,
            // fit: BoxFit.fitWidth

            // colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        // height: 80,width: 250,
        decoration: BoxDecoration(

          shape: BoxShape.rectangle,
        ),
        child: Icon(Icons.image_rounded,color: Colors.grey,),
      ),
    );
  }

  funcInitializeValues(){

    if(isAutoScroll == null){
      isAutoScroll = false;
    }
    if(isDotsIndicatorDisplay == null){
      isDotsIndicatorDisplay = true;
    }

    if(isAutoScroll!) {

      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {

        if(_currentPage + 1 == itemCount){
          _currentPage = 0;
          _pageController.jumpToPage(0);
        }
        else {
          _currentPage += 1;
          _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutSine);
        }

      });
    }

  }

  @override
  Widget build(BuildContext context) {

    funcInitializeValues();

    return AspectRatio(aspectRatio: aspectRatio,child: funcStyle(style),);
  }

  Widget funcStyle(enumStyle varStyle){
    
    switch (varStyle) {
      
      case enumStyle.Style1: return Style1(itemCount: itemCount!,itemBuilder: this.itemBuilder!, context: context, isAutoScroll: isAutoScroll!, aspectRatio: aspectRatio, isDotsIndicatorDisplay: isDotsIndicatorDisplay!);

      case enumStyle.Style2: return Style2(itemCount: itemCount!,itemBuilder: this.itemBuilder!,context: context, isAutoScroll: isAutoScroll!, aspectRatio: aspectRatio, isDotsIndicatorDisplay: isDotsIndicatorDisplay!);
      
      case enumStyle.Style3: return Style3(context: context, isAutoScroll: isAutoScroll!, aspectRatio: aspectRatio, isDotsIndicatorDisplay: isDotsIndicatorDisplay!,arrayItems: arrayItems!,);
                             
      default :  return Style1(itemCount: itemCount!,itemBuilder: this.itemBuilder!,context: context, isAutoScroll: isAutoScroll!, aspectRatio: aspectRatio, isDotsIndicatorDisplay: isDotsIndicatorDisplay!);
    }
    
  }

}

enum enumStyle { Style1, Style2 , Style3 }