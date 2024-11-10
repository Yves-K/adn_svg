import 'package:xml/xml.dart' as xml_for_style;
import 'dart:convert';

String styleSvg(String svgContent, dynamic stylesConfig) {
  Map<String, Map<String, dynamic>> modeConfigs;

  if (stylesConfig is String) {
    try {
      modeConfigs =
          jsonDecode(stylesConfig) as Map<String, Map<String, dynamic>>;
    } catch (e) {
      throw FormatException('Invalid JSON format for stylesConfig: $e');
    }
  } else if (stylesConfig is Map) {
    bool isValidMapOfMaps = stylesConfig.values.every((value) => value is Map);

    if (isValidMapOfMaps) {
      modeConfigs = stylesConfig.cast<String, Map<String, dynamic>>();
    } else {
      throw ArgumentError(
          'Invalid map structure for stylesConfig. Expected a map of maps.');
    }
  } else {
    throw ArgumentError(
        'Invalid type for stylesConfig. Expected String (JSON), Map<String, Map<String, dynamic>>, or any map of maps.');
  }

  final document = xml_for_style.XmlDocument.parse(svgContent);
  final paths = document.findAllElements('path');

  for (int i = 0; i < paths.length; i++) {
    final path = paths.elementAt(i);
    final classes = path.getAttribute('class')?.split(' ') ?? [];

    // Apply styles from numbered parameters (BEFORE class-based styles)
    if (modeConfigs.containsKey('_$i')) {
      _applyStyles(path, modeConfigs['_$i']!);
    }

    // Apply styles from class names
    for (var mode in modeConfigs.keys
        .where((k) => !k.startsWith('_') && k != 'default')) {
      if (classes.contains(mode)) {
        _applyStyles(path, modeConfigs[mode]!);
        break;
      }
    }

    // Apply styles from numbered parameters (AFTER class-based styles)
    if (modeConfigs.containsKey('__$i')) {
      _applyStyles(path, modeConfigs['__$i']!);
    }

    // Apply default styles if no mode matched
    if (modeConfigs.containsKey('default') &&
        !classes.any((c) => modeConfigs.keys.contains(c)) &&
        !modeConfigs.keys
            .any((k) => k.startsWith('_') && k.substring(1) == i.toString()) &&
        !modeConfigs.keys
            .any((k) => k.startsWith('__') && k.substring(2) == i.toString())) {
      _applyStyles(path, modeConfigs['default']!);
    }
  }

  return document.toXmlString();
}

void _applyStyles(
    xml_for_style.XmlElement element, Map<String, dynamic> styles) {
  for (var entry in styles.entries) {
    final attributeName = entry.key;
    final attributeValue = entry.value;

    if (attributeValue != null) {
      if (attributeValue is num) {
        element.setAttribute(attributeName, attributeValue.toString());
      } else {
        element.setAttribute(attributeName, attributeValue.toString());
      }
    } else {
      if (element.attributes.any((attr) => attr.name.local == attributeName)) {
        element.removeAttribute(attributeName);
      }
    }
  }
}
