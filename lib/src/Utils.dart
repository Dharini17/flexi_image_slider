import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Utils{

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
