import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flexi_image_slider/flexi_image_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flexi Image Slider'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<String> arrayImages = [

    "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/5/9/6/m-all-rbc-white-one-nb-nicky-boy-original-imagpycw749kqzdz.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/w/8/l/l-all-rbc-white-one-nb-nicky-boy-original-imagpyct8f5hhauz.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/4/2/c/s-all-rbc-one-nb-nicky-boy-original-imagpycxgmnxretx.jpeg?q=70",
    "https://rukminim2.flixcart.com/image/832/832/xif0q/t-shirt/8/3/7/l-all-rbc-white-one-nb-nicky-boy-original-imagpycbphvjfmk4.jpeg?q=70"

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: flexi_image_slider(

          //required fields ---------

          context: context,
          aspectRatio: 16/14,
          arrayImages: arrayImages,

          //optional fields ------------

          autoScroll: true,
          viewportFraction: 0.8,
          boxFit: BoxFit.fill,
          indicatorPosition: IndicatorPosition.overImage,//IndicatorPosition.afterImage,IndicatorPosition.overImage,IndicatorPosition.none
          indicatorAlignment: IndicatorAlignment.left,//IndicatorAlignment.left,IndicatorAlignment.right,IndicatorAlignment.center
          duration: const Duration(seconds: 4),
          indicatorColor: Colors.blue,
          borderRadius: 0,
          onTap: (int index){
            print("$index index clicked");
            //handle your click events
          },
        ),
      ),
    );
  }


}
