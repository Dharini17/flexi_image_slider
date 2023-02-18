import 'dart:async';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';

/// Checks if you are awesome. Spoiler: you are.
class flexi_image_slider extends StatelessWidget{


  final List<String> arrayImages;
  final BuildContext context;
  bool? isAutoScroll;
  final double aspectRatio;
  bool? isDotsIndicatorDisplay;

  //-----------------------

  ClassCurrentIndex varClassCurrentIndex = ClassCurrentIndex();

  Timer? _timer;
  PageController _pageController = PageController(initialPage: 0,);

  int _currentPage = 0;

   flexi_image_slider({super.key, required this.arrayImages, required this.context, this.isAutoScroll, required this.aspectRatio, this.isDotsIndicatorDisplay});

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

        if(_currentPage + 1 == arrayImages.length){
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

    return ChangeNotifierProvider(
        create: (_) {
          return varClassCurrentIndex;
        },

        child:
        Consumer<ClassCurrentIndex> (
          builder: (BuildContext context, value, child) {
            return  AspectRatio(
              aspectRatio: aspectRatio,
              child:
              arrayImages.isEmpty ?

              Center(child: Text("No Images Found"),) :

              Stack(
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
                        itemCount: arrayImages.length,// == 1 ? 1 : 999,
                        // physics: arrayImages.length == 1 ? NeverScrollableScrollPhysics() : ScrollPhysics(),
                        itemBuilder: (context, index) {

                          return funcDisplayImage("${arrayImages[ index % arrayImages.length ]}",BoxFit.fitHeight);

                        },
                      )

                  ),

                  Positioned(
                      left: 0,right: 0,bottom: 0,
                      child:

                      isDotsIndicatorDisplay! ?

                      DotsIndicator(
                        dotsCount: arrayImages.length,
                        position: double.parse("${varClassCurrentIndex._currentPage}"),
                        decorator: DotsDecorator(
                          size: const Size.square(5.0),
                          activeSize: Size(15.0, 5.0),
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.37), // Inactive color
                          activeColor: Theme.of(context).colorScheme.primary,
                          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ) : const SizedBox()
                  ),

                ],
              ),
            );
          },
        )
    );
  }

}

class ClassCurrentIndex extends ChangeNotifier{
  int _currentPage = 0;

  funcUpdateCurrentValue(int valNew){
    _currentPage = valNew;
    notifyListeners();
  }
}