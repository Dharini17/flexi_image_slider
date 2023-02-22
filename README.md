## flexi_image_slider

Image slider with auto scroll, dots indicator

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_image_slider/master/assets/screenshot.png">
      </td>    
    </tr>
</table>

## Features

- set image with your aspect ratio
- auto scroll option
- display dots indicator option

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexi_image_slider: <latest_version>
```

## Usage

```dart

//STYLE 1 =========================================================================
flexi_image_slider(
style: enumStyle.Style1,
context: context,
aspectRatio: 16/9,
itemCount: arrayImages.length,
itemBuilder: (BuildContext context, int index) {

return funcDisplayImage("${arrayImages[ index ]}",BoxFit.fitHeight);

},

),

//STYLE 2 =========================================================================
flexi_image_slider(
style: enumStyle.Style2,
context: context,
aspectRatio: 16/9,
itemCount: arrayImages.length,
itemBuilder: (BuildContext context, int index) {

return funcDisplayImage("${arrayImages[ index ]}",BoxFit.fitHeight);

},
),

//STYLE 3 =========================================================================
flexi_image_slider(

style: enumStyle.Style3,
context: context,
aspectRatio: 16/9,
arrayItems: List.generate(arrayImages.length, (index){
return ClipRRect(
borderRadius: BorderRadius.circular(5),
child: funcDisplayImage("${arrayImages[ index ]}",BoxFit.fitHeight),
);
}),
),

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


```