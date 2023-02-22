import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../flexi_image_slider.dart';

class Style3 extends StatelessWidget{

  final BuildContext context;
  bool isAutoScroll;
  final double aspectRatio;
  bool isDotsIndicatorDisplay;
  final List<Widget> arrayItems;

  Style3({required this.context, required this.isAutoScroll, required this.aspectRatio, required this.isDotsIndicatorDisplay,required this.arrayItems});

  ClassCurrentIndex3 varClassCurrentIndex = ClassCurrentIndex3();

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 999);//0,);


  funcInitializeValues(){

    if(isAutoScroll == null){
      isAutoScroll = false;
    }
    if(isDotsIndicatorDisplay == null){
      isDotsIndicatorDisplay = true;
    }

    Future.delayed(Duration(milliseconds: 800),(){
      _pageController.jumpToPage(0);
      varClassCurrentIndex.funcUpdateCurrentValue(0);
      // _pageController.animateToPage(0, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutSine);
    });

    // if(isAutoScroll!) {
    //
    //   _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
    //
    //
    //     _pageController.nextPage(duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutSine);
    //
    //     if(varClassCurrentIndex._currentPage + 1 == 999){
    //       varClassCurrentIndex._currentPage = 0;
    //       _pageController.jumpToPage(0);
    //     }
    //     else {
    //       _currentPage += 1;
    //       _pageController.animateToPage(_currentPage, duration: const Duration(milliseconds: 1000), curve: Curves.easeInOutSine);
    //     }
    //
    //   });
    // }

  }

  @override
  Widget build(BuildContext context) {

    funcInitializeValues();

    _pageController = PageController(initialPage: 999,viewportFraction:0.73);


    return

      ChangeNotifierProvider(
          create: (_) {
            return varClassCurrentIndex;
          },

          child:
          Consumer<ClassCurrentIndex3> (
            builder: (BuildContext context, value, child) {
              return

                PageView.builder(
                  controller: _pageController,
                  //itemCount: arrayItems.length,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  onPageChanged: (int currentPage){

                    print("currentPage : ${currentPage%arrayItems.length}");

                    varClassCurrentIndex.funcUpdateCurrentValue(currentPage%arrayItems.length);

                  },
                  itemBuilder: (context, index) {

                    int varIndex = index%arrayItems.length;

                    print("varIndex : $varIndex");

                    return TweenAnimationBuilder(
                        tween: Tween(begin: varClassCurrentIndex._currentPage == varIndex ? 1.0 : 0.8, end: varClassCurrentIndex._currentPage == varIndex ? 1.0 : 0.8),
                        duration: const Duration(milliseconds: 350),
                        child: this.arrayItems[varIndex],
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        });
                  });
            },
          )
      );
  }

}

class ClassCurrentIndex3 extends ChangeNotifier{
  int _currentPage = 0;

  funcUpdateCurrentValue(int valNew){
    _currentPage = valNew;
    notifyListeners();
  }
}
