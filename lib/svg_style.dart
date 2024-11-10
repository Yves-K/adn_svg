import 'package:xml/xml.dart' as xml_for_style;

String manipulateSvg(String svgContent, Map<String, Map<String, dynamic>> modeConfigs) {
  final document = xml_for_style.XmlDocument.parse(svgContent);
  final paths = document.findAllElements('path');

  for (var path in paths) {
    final classes = path.getAttribute('class')?.split(' ') ?? [];
    bool hasMatchingMode = false;

    // Check if path has any of our mode classes
    for (var mode in modeConfigs.keys.where((k) => k != 'default')) {
      if (classes.contains(mode)) {
        hasMatchingMode = true;
        _applyStyles(path, modeConfigs[mode]!);
        break;
      }
    }

    // Apply default styles if no mode matched
    if (!hasMatchingMode && modeConfigs.containsKey('default')) {
      _applyStyles(path, modeConfigs['default']!);
    }
  }

  return document.toXmlString();
}

void _applyStyles(xml_for_style.XmlElement element, Map<String, dynamic> styles) {
  if (styles['color'] != null) {
    element.setAttribute('fill', styles['color']);
  }
  if (styles['opacity'] != null) {
    element.setAttribute('opacity', styles['opacity'].toString());
  }
}