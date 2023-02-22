import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../flexi_image_slider.dart';

class Style2 extends StatelessWidget{

  final int itemCount;
  final NullableIndexedWidgetBuilder itemBuilder;
  final BuildContext context;
  bool isAutoScroll;
  final double aspectRatio;
  bool isDotsIndicatorDisplay;

  Style2({required this.itemCount,required this.itemBuilder ,required this.context, required this.isAutoScroll, required this.aspectRatio, required this.isDotsIndicatorDisplay});

  ClassCurrentIndex2 varClassCurrentIndex = ClassCurrentIndex2();

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0,);

  int _currentPage = 0;

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

    return  Stack(
      children: [

        //image view
        Positioned(
            top: 0,left: 0,right: 0,bottom: 0,
            child:

            PageView.builder(
              controller:_pageController,
              onPageChanged: (int currentPage){
                varClassCurrentIndex.funcUpdateCurrentValue(currentPage);
              },
              itemCount: itemCount,// == 1 ? 1 : 999,
              // physics: arrayImages.length == 1 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
              itemBuilder: itemBuilder,
            )

        ),

        Positioned(
            left: 0,right: 0,bottom: 0,
            child:

            isDotsIndicatorDisplay! ?

            ChangeNotifierProvider(create: (_) {
                    return varClassCurrentIndex;
                  }, child: Consumer<ClassCurrentIndex2>(
                    builder: (BuildContext context, value, child) {
                      return DotsIndicator(
                        dotsCount: itemCount,
                        position: double.parse(
                            "${varClassCurrentIndex._currentPage}"),
                        decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: Size(15.0, 5.0),
                          color: Theme.of(context)
                              .colorScheme
                              .onBackground
                              .withOpacity(0.37),
                          // Inactive color
                          activeColor: Theme.of(context).colorScheme.primary,
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      );
                    },
                  ))
                : const SizedBox()
        ),

      ],
    );

  }

}


class ClassCurrentIndex2 extends ChangeNotifier{
  int _currentPage = 0;

  funcUpdateCurrentValue(int valNew){
    _currentPage = valNew;
    notifyListeners();
  }
}