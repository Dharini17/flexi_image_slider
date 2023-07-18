import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'Utils.dart';

class flexi_image_slider extends StatelessWidget{

  BuildContext context;
  final bool autoScroll;
  double aspectRatio;
  final BoxFit boxFit;
  List<String> arrayImages;
  final double viewportFraction;
  final Function? onTap;
  final bool showIndicator;
  final bool showIndicatorBottom;
  final Duration duration;
  final double borderRadius;

   flexi_image_slider({
     super.key,
     required this.context,
     this.autoScroll = true,
     required this.aspectRatio,
     this.boxFit = BoxFit.fitWidth,
     required this.arrayImages,
     this.viewportFraction = 1.0,
     this.onTap,
     this.showIndicator = false,
     this.showIndicatorBottom = false,
     this.duration = const Duration(seconds: 3),
     this.borderRadius = 0.0
   });

  Timer? timer;
  PageController pageController = PageController();
  ValueNotifier<int> newIndexValue = ValueNotifier(0);

  Widget funcDotsIndicator(){
    return Padding(padding: EdgeInsets.only(top: 8,bottom: 8),
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
    );
  }

  @override
  Widget build(BuildContext context) {

   pageController = PageController(initialPage: 999,viewportFraction: viewportFraction!);

   if(autoScroll){
     timer = Timer.periodic(duration, (Timer timer) {
       pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeInOutSine);
     });}

    return

      Column(
        children: [

          AspectRatio(
              aspectRatio: aspectRatio,
              child:Stack(
                children: [

                  Positioned.fill(
                      child: PageView.builder(
                          padEnds: true,
                          controller: pageController,
                          onPageChanged: (newIndex){
                            newIndexValue.value = newIndex;
                            newIndexValue.notifyListeners();
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                                onTap: ()=>onTap!(index%arrayImages.length),
                                child: Padding(
                                  padding: viewportFraction == 1.0 ? EdgeInsets.zero : const EdgeInsets.only(left: 5,right: 5),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(borderRadius),
                                      child: Utils.funcDisplayImage(arrayImages[index%arrayImages.length], boxFit!)),
                                ));
                          }
                      )
                  ),

                  Positioned(
                    left: 0,right: 0,bottom: 0,
                    child:  showIndicator && !showIndicatorBottom ?
                    funcDotsIndicator()
                        :
                    const SizedBox(),
                  )

                ],
              )
          ),

          showIndicator && showIndicatorBottom ?
          funcDotsIndicator()
              :
          const SizedBox()

        ],
      );
  }
}