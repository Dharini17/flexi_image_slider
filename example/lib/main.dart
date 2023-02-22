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

  "https://i.ibb.co/7yBRJcc/Screenshot-2023-02-18-at-12-04-20-PM.png",
  "https://i.ibb.co/925Nc43/Screenshot-2023-02-18-at-12-04-28-PM.png",
  "https://i.ibb.co/5WDVHnv/Screenshot-2023-02-18-at-12-04-46-PM.png",
  "https://i.ibb.co/ZfjCq7G/Screenshot-2023-02-18-at-12-04-53-PM.png",

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

              Text("Style1",textAlign: TextAlign.center,),

              const SizedBox(height: 10,),

            //STYLE 1 =========================================================================
              flexi_image_slider(
                  style: enumStyle.Style1,
                  context: context,
                  aspectRatio: 16/9,
                itemCount: arrayImages.length,
                itemBuilder: (BuildContext context, int index) {

                  return funcDisplayImage("${arrayImages[ index % arrayImages.length ]}",BoxFit.fitHeight);

                },

              ),


            const SizedBox(height: 20,),

            Text("Style2",textAlign: TextAlign.center,),

            const SizedBox(height: 10,),

            //STYLE 2 =========================================================================
            flexi_image_slider(
              style: enumStyle.Style2,
              context: context,
              aspectRatio: 16/9,
              itemCount: arrayImages.length,
              itemBuilder: (BuildContext context, int index) {

                return funcDisplayImage("${arrayImages[ index % arrayImages.length ]}",BoxFit.fitHeight);

              },
            ),

            const SizedBox(height: 20,),

            Text("Style3",textAlign: TextAlign.center,),

            const SizedBox(height: 10,),

            //STYLE 3 =========================================================================
            flexi_image_slider(

              style: enumStyle.Style3,
              context: context,
              aspectRatio: 16/9,
              arrayItems: List.generate(arrayImages.length, (index){
                return ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: funcDisplayImage("${arrayImages[ index % arrayImages.length ]}",BoxFit.fitHeight),
                );
              }),
            ),

          ],
        ),
    );
  }

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

}
