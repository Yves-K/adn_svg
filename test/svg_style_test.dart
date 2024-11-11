import 'package:flutter_test/flutter_test.dart';
import 'package:adn_svg/svg_style.dart';

void main() {
  test('manipulates SVG with mode-based styles', () {
    const svgContent = '''
      <svg>
        <path class="mode1" />
        <path class="mode2 default" />
        <path />
      </svg>
    ''';

    const modeConfigs = {
      'mode1': {'color': 'red'},
      'mode2': {'opacity': 0.5},
      'default': {'color': 'blue'},
    };

    final result = styleSvg(svgContent, modeConfigs);

    expect(result, contains('<path class="mode1" fill="red" />'));
    expect(result, contains('<path class="mode2 default" opacity="0.5" />'));
    expect(result, contains('<path fill="blue" />'));
  });
}
