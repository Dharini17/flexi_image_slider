import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../flexi_image_slider.dart';

class Style1 extends StatelessWidget{

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final BuildContext context;
  bool isAutoScroll;
  final double aspectRatio;
  bool isDotsIndicatorDisplay;

  Style1({required this.itemCount,required this.itemBuilder ,required this.context, required this.isAutoScroll, required this.aspectRatio, required this.isDotsIndicatorDisplay});

  ClassCurrentIndex1 varClassCurrentIndex = ClassCurrentIndex1();

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0,);

  int _currentPage = 0;

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

    return  PageView.builder(
      controller:_pageController,
      onPageChanged: (int currentPage){
        varClassCurrentIndex.funcUpdateCurrentValue(currentPage);
      },
      itemCount: itemCount,// == 1 ? 1 : 999,
      // physics: arrayImages.length == 1 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
      itemBuilder: itemBuilder,
    );

  }

}

class ClassCurrentIndex1 extends ChangeNotifier{
  int _currentPage = 0;

  funcUpdateCurrentValue(int valNew){
    _currentPage = valNew;
    notifyListeners();
  }
}
