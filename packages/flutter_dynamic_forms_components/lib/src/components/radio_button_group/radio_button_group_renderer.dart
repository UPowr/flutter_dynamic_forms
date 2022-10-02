import 'package:dynamic_forms/dynamic_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dynamic_forms/flutter_dynamic_forms.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dynamic_forms_components/flutter_dynamic_forms_components.dart';

class RadioButtonGroupRenderer extends FormElementRenderer<RadioButtonGroup> {
  @override
  Widget render(
      RadioButtonGroup element,
      BuildContext context,
      FormElementEventDispatcherFunction dispatcher,
      FormElementRendererFunction renderer) {
    var errorText = element.validations
        .cast<Validation?>()
        .firstWhere((v) => !v!.isValid, orElse: () => null)
        ?.message;

    return LazyStreamBuilder(
      streamFactory: () => MergeStream(
        [
          element.choicesChanged,
          ...element.choices.map((child) => child.isVisibleChanged),
        ],
      ),
      builder: (context, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            ...element.choices
                .where((c) => c.isVisible)
                .map((choice) => renderer(choice, context))
                .toList(),
            if (errorText != null)
              Text(
                errorText,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Theme.of(context).errorColor),
              ),
          ],
        );
      },
    );
  }
}
