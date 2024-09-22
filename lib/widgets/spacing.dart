import 'package:flutter/widgets.dart';

extension SpacingExtension on num {
  // Horizontal space
  Widget get pw => SizedBox(width: toDouble());

  // Vertical space
  Widget get ph => SizedBox(height: toDouble());
}
