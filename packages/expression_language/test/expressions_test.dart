import 'dart:async';
// ignore: import_of_legacy_library_into_null_safe
import 'package:gherkin/gherkin.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:glob/glob.dart';

import 'supporting_files/index.dart';

void main() async {
  final config = TestConfiguration()
    ..features = [Glob(r'test/features/**.feature')]
    ..exitAfterTestRun = false
    ..reporters = [
      StdoutReporter(MessageLevel.error),
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: 'test/report.json')
    ]
    ..createWorld = (TestConfiguration config) {
      return Future.value(ExpressionWorld());
    }
    ..stepDefinitions = [
      GivenFormElementIsProvided(),
      GivenCustomExpressionIsProvided(),
      WhenExpressionIsEvaluated(),
      ThenIntExpressionResult(),
      ThenStringExpressionResult(),
      ThenDecimalExpressionResult(),
      ThenBoolExpressionResult(),
      ThenExceptionThrownResult(),
      ThenDateTimeExpressionResult(),
    ];

  var runner = GherkinRunner();
  await runner.execute(config);
}
