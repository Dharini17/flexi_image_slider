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

return funcDisplayImage("${arrayImages[ index % arrayImages.length ]}",BoxFit.fitHeight);

},

),

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


```