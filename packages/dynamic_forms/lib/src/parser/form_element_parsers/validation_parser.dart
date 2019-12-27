import 'package:dynamic_forms/dynamic_forms.dart';

class ValidationParser<TValidation extends Validation>
    extends FormElementParser<TValidation> {
  @override
  String get name => "validation";

  @override
  FormElement getInstance() => Validation();

  @override
  void fillProperties(
      TValidation formElement, ParserNode parserNode, Element parent, parser) {
    super.fillProperties(formElement, parserNode, parent, parser);
    formElement
      ..messageProperty = parserNode.getStringValue("message")
      ..isValidProperty = parserNode.getValue(
          "isValid", ParserNode.convertToBool, ParserNode.defaultTrue);
  }
}
