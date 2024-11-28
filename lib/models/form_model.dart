import 'form_field.dart';

class FormModel {
  final String id;
  final String title;
  List<FormField> fields = [];

  FormModel({
    required this.id,
    required this.title,
  });
}
