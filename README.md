## flexi_image_slider

Image slider with auto scroll, dots indicator

<table>
   <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_image_slider/master/assets/screenshot1.jpeg">
      </td>   
<td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_image_slider/master/assets/screenshot2.jpeg">
      </td>  
    </tr>
  <tr>
      <td>
         <img width="250px" src="https://raw.githubusercontent.com/Dharini17/flexi_image_slider/master/assets/screenshot3.jpeg">
      </td>  
    </tr>
</table>

## Features

- set image with your aspect ratio
- auto scroll option
- image zoom view

- Style1 : simple image slider with zoom view
- Style2 : image slider with dots indicator
- Style3 : image with left right preview

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexi_image_slider: 1.0.4
```

## Usage

```dart

        flexi_image_slider(
        
        style: enumStyle.Style1, //Style2, //Style3,
        context: context,
        aspectRatio: 16/9,
        autoScroll: false,
        boxFit: BoxFit.fill,
        arrayImages: arrayImages
        ),

```