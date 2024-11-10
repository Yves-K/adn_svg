# svg_style

# Styling SVGs
using css like configuration(s).

<b>Supercharge your Flutter apps with dynamic SVG styling</b>
## Description
- A Flutter package for dynamically styling SVGs based on mode configurations.
- Enhance your Flutter apps with dynamic SVG styling!
- This package allows you to easily adjust the appearance of your SVGs based on different modes, such as light and dark themes.

## Installation
Add **```svg_style```** to your **```pubspec.yaml```** dependencies:

## YAML
```
dependencies:
  svg_style: ^1.0.0
```
Then, run **```flutter pub get```** to fetch the package.

## Usage
1. Import the Package:

2. Use the **```manipulateSvg Function(svgContent, styleParams)```**
> svgContent is you svg...  
> styleParams is any **map of maps** or **json**
```
{
    "primary"    : {
        "fill"       : "orangered",
        "opacity"    : .8
    },
    "secondary   :{
        "fill"       : "black",
        "opacity"    : 1
    },
    "default     :{
        "fill"       : "blue",
        "opacity"    : .5
    }    
}
```
You can use any of the style parameters defined on the [**w3.org Scalable Vector Graphics (SVG) 2**](https://www.w3.org/TR/SVG2/styling.html) 

4. Display the styled SVG

## How does it work
- The manipulateSvg function parses your SVG content and identifies paths.
- It applies styles based on the provided mode configurations and path classes.
- The modified SVG string with styled paths is returned.
Customization

You can customize the modeConfigs to achieve various styling effects.

