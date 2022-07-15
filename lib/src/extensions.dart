import 'package:flutter/material.dart';
import 'package:preview_knobs/src/controller.dart';

import 'provider.dart';

extension KnobsExtensions on BuildContext {
  KnobsController get preview_knobs {
    return KnobsProvider.of(this);
  }
}
