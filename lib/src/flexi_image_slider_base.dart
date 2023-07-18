import 'dart:async';
import 'package:flexi_image_slider/src/Style1.dart';
import 'package:flexi_image_slider/src/Style2.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'Style3.dart';

//https://stackoverflow.com/questions/63010195/flutter-fade-animation-between-page-views

/// Checks if you are awesome. Spoiler: you are.
class flexi_image_slider extends StatelessWidget{

  final enumStyle style;
  final BuildContext context;
  final autoScroll;
  final double aspectRatio;
  final BoxFit boxFit;
  final List<String> arrayImages;

   flexi_image_slider({
     super.key,
     required this.style,
     required this.context,
     required this.autoScroll,
     required this.aspectRatio,
     required this.boxFit,
     required this.arrayImages
   });

  @override
  Widget build(BuildContext context) {

    return funcStyle(style);
  }

  Widget funcStyle(enumStyle varStyle){
    
    switch (varStyle) {
      
      case enumStyle.Style1: return Style1(context: context, autoScroll: autoScroll!, aspectRatio: aspectRatio,boxFit: BoxFit.fill, arrayImages: arrayImages!);

      case enumStyle.Style2: return Style2(context: context, autoScroll: autoScroll!, aspectRatio: aspectRatio,boxFit: BoxFit.fill, arrayImages: arrayImages!);
      
      case enumStyle.Style3: return Style3(context: context, autoScroll: autoScroll!, aspectRatio: aspectRatio, boxFit: BoxFit.fill, arrayImages: arrayImages!);
                             
      default :  return Style1(context: context, autoScroll: autoScroll!, aspectRatio: aspectRatio,boxFit: BoxFit.fill, arrayImages: arrayImages!);
    }
    
  }

}

enum enumStyle { Style1, Style2 , Style3 }