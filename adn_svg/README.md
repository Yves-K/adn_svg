# Styling SVG in Flutter
using straight forward css like styleParams.

<b>Supercharge your Flutter apps with dynamic SVG styling</b>
## Description
- A Flutter package for dynamically styling SVGs based on mode configurations.
- Enhance your Flutter apps with dynamic SVG styling!
- This package allows you to easily adjust the appearance of your SVGs based on different modes, such as light and dark themes.
>styleSvg offers a versatile and powerful approach to managing SVG styles in Flutter. It promotes code organization, consistency, flexibility, and reusability. The central control and dynamic styling capabilities make it a solid choice for handling SVG elements in diverse use cases.

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

2. Use the **```styleSvg Function(svgContent, styleParams)```**
> svgContent is you svg...  
> styleParams is any **map of maps** or **json**
```
{
    "key"        : {
        "property"   : "value"
    },
    "primary"    : {
        "fill"       : "orangered",
        "opacity"    : .8
    },
    "secondary"  :{
        "fill"       : "black",
        "opacity"    : 1
    },
    "_1"         :{
        "fill"       : "black",
        "opacity"    : 1
    },
    "default     :{
        "fill"       : "blue",
        "opacity"    : .5
    }    
}
```
3. Display the styled SVG

## How does it work
- The styleSvg function parses your SVG and traverse paths.
- A path will be if :
  - **class** contains the key (primary, secondary)
  - the path **index** in svg is the key (_1, __1)
  - none of the previous rules aply AND there is a **default** style
- It applies styles based on the provided mode configurations and path classes.
- The modified SVG string with styled paths is returned.

## Customization
You can customize the styleParams to achieve various styling effects using any of the style parameters defined on the [**w3.org Scalable Vector Graphics (SVG) 2**](https://www.w3.org/TR/SVG2/styling.html) 

## Complex problems solved by priority
To address complex styling problems or svg contents with few or no class we use an aply hierarchy.
For each path :
1. the index rule aply **before** when marked with one **_** *underscore*.
2. classes apply by their **order** in parameters.
3. the index rule aply **after** when marked with two **__** *underscores*.
4. then **default** aply if exist.

## Warnings

### map index
we use a **1 base index** (so the first path in your svg has index = 1)

### value type
Param value must use the right type (string or number)  
**❌** 'opacity' : '.5' (as a string) will do nothing  
**✅ 'opacity' : .5**

## Contributing
We welcome contributions to improve this package. Please refer to the CONTRIBUTING file for guidelines.
Let us know how svg_style enhances your Flutter projects!

## License
This project is licensed under the MIT License (see LICENSE for details).

## Thanks
*It is very important for me to thank my dear friend [Quentin Uriel](https://www.linkedin.com/in/quentin-uriel/) who gave me so much time and help in implementing our solutions*
