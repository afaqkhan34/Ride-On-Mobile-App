import 'package:flutter_test/flutter_test.dart';
import 'package:Afaq/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TripDetailsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
