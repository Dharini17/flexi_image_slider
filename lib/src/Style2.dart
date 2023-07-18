import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flexi_image_slider/src/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

class Style2 extends StatelessWidget{

  final BuildContext context;
  bool autoScroll;
  final double aspectRatio;
  BoxFit boxFit;
  List<String> arrayImages;

  Style2({required this.context, required this.autoScroll, required this.aspectRatio, required this.boxFit,required this.arrayImages});

  Timer? _timer;
  final PageController _pageController = PageController(initialPage: 999,viewportFraction: 1.0);
  ValueNotifier<int> newIndexValue = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {

    if(autoScroll){
      _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
        _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOutSine);
      });}

    return Column(
      children: [
        AspectRatio(
            aspectRatio: aspectRatio,
            child: PageView.builder(
                padEnds: true,
                controller: _pageController,
                onPageChanged: (newIndex){
                  // print("${newIndex%arrayImages.length}");
                  newIndexValue.value = newIndex%arrayImages.length;
                  newIndexValue.notifyListeners();
                },
                itemBuilder: (context, index) {
                  return
                    InkWell(
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>
                          gallery_zoom_slides(
                              arrayImages: arrayImages,
                              currentIndex: index%arrayImages.length)
                      )),
                      child:
                      Utils.funcDisplayImage(arrayImages[index%arrayImages.length], boxFit),);
                }
            )
        ),
        Padding(padding: EdgeInsets.only(top: 8,bottom: 8),
          child: ValueListenableBuilder(
              valueListenable: newIndexValue,
              builder: (context,value,child){
                  return DotsIndicator(
                    dotsCount: arrayImages.length,
                    position: double.parse(
                        "${value%arrayImages.length}"),
                    decorator: DotsDecorator(
                      size: const Size.square(5.0),
                      activeSize: Size(15.0, 5.0),
                      color: Theme.of(context).colorScheme.onBackground.withOpacity(0.37),
                      // Inactive color
                      activeColor: Theme.of(context).colorScheme.primary,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  );
              }),
        )
      ],
    );
  }

}
