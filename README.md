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

## Installation

In your `pubspec.yaml` file within your Flutter Project:

```yaml
dependencies:
  flexi_image_slider: 1.0.5
```

## Usage

        //required fields

        aspectRatio: set you slider height like 1.0,1.5,2.0 etc...
        arrayImages: pass your List<String> type array which contains image urls
        
        //optional fields ------------
        
        autoScroll: auto scroll enable disable by set true/false here
        viewportFraction: set its value between 0.5 to 0.9 for display left & right side image preview
        boxFit: set your image content mode 
        indicatorPosition: set indicator position like none,over slider or display at bottom of slider
        indicatorAlignment: where you want to set your slider like left,right or center
        duration: set your slider image changed speed by setting duration 
        indicatorActiveColor: set active color for indicator,
        indicatorActiveColor: set deactive color for indicator,
        borderRadius: set any double value for give radius to your image
        onTap : want to execute some action on image click use this

```dart
      
        //import package
        import 'package:flexi_image_slider/flexi_image_slider.dart';


        flexi_image_slider(

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
            indicatorActiveColor: Colors.blue,
            indicatorDeactiveColor: Colors.grey,
            borderRadius: 0,
            onTap: (int index){
            print("$index index clicked");
            //handle your click events
            },
        ),

```

NOTE: Images used only for demo purpose