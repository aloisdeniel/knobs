import 'package:flutter/material.dart';
import 'package:knobs/src/controller.dart';

import 'provider.dart';

extension KnobsExtensions on BuildContext {
  KnobsController get knobs {
    return KnobsProvider.of(this);
  }
}
