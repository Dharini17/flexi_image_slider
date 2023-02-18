#flexi_image_slider

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

flexi_image_slider(
arrayImages: [

"https://i.ibb.co/7yBRJcc/Screenshot-2023-02-18-at-12-04-20-PM.png",
"https://i.ibb.co/925Nc43/Screenshot-2023-02-18-at-12-04-28-PM.png",
"https://i.ibb.co/5WDVHnv/Screenshot-2023-02-18-at-12-04-46-PM.png",
"https://i.ibb.co/ZfjCq7G/Screenshot-2023-02-18-at-12-04-53-PM.png",

],
context: context,
aspectRatio: 16/9
),


```