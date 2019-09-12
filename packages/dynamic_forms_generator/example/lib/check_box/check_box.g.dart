// GENERATED CODE - DO NOT MODIFY BY HAND

import '../components.dart';
import 'package:meta/meta.dart';

class CheckBox extends FormElement {
  static const String labelPropertyName = "label";
  static const String valuePropertyName = "value";

  String get label => properties[labelPropertyName].value;
  Stream<String> get labelChanged => properties[labelPropertyName].valueChanged;

  bool get value => properties[valuePropertyName].value;
  Stream<bool> get valueChanged => properties[valuePropertyName].valueChanged;

  void fillCheckBox({
    @required String id,
    @required ElementValue<FormElement> parent,
    @required ElementValue<bool> isVisible,
    @required ElementValue<String> label,
    @required ElementValue<bool> value,
  }) {
  }

  @override
  FormElement getInstance() {
    return CheckBox();
  }
}
