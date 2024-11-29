import 'form_field.dart';

class FormModel {
  final String id;
  final String title;
  List<MarkFormField> fields = [];

  FormModel({
    required this.id,
    required this.title,
    this.fields = const [],
  });
}
