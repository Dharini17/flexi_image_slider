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

  "https://neilpatel.com/wp-content/uploads/2017/08/blog.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_9es5pEx_zEWpotZu7uvsP4cAtd7QorgZhQ&usqp=CAU",
    "https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/06/How_To_Start_A_Blog_-_article_image.jpg",
    "https://blog.hubspot.com/hs-fs/hubfs/blog-examples-2.jpg?width=595&height=400&name=blog-examples-2.jpg"

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
                padding: EdgeInsets.only(top: 15,bottom: 15),
          children: <Widget>[

            const Padding(
              padding:  EdgeInsets.only(top:10,bottom: 10),
              child: Text("Style1",textAlign: TextAlign.center,),
            ),

            //STYLE 1
            flexi_image_slider(

                style: enumStyle.Style1,
                context: context,
                aspectRatio: 16/9,
                autoScroll: false,
                boxFit: BoxFit.fill,
                arrayImages: arrayImages
            ),

            const Padding(
              padding:  EdgeInsets.only(top:10,bottom: 10),
              child: Text("Style2",textAlign: TextAlign.center,),
            ),

            //STYLE 2
            flexi_image_slider(

                style: enumStyle.Style2,
                context: context,
                aspectRatio: 16/9,
                autoScroll: true,
                boxFit: BoxFit.fill,
                arrayImages: arrayImages
            ),


             const Padding(
               padding:  EdgeInsets.only(top:10,bottom: 10),
               child: Text("Style3",textAlign: TextAlign.center,),
             ),

            //STYLE 3
            flexi_image_slider(

              style: enumStyle.Style3,
              context: context,
              aspectRatio: 16/9,
              autoScroll: true,
              boxFit: BoxFit.fill,
              arrayImages: arrayImages
          ),

          ],
        ),
    );
  }


}
