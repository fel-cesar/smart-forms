abstract class FormField {
  final String id;
  final String label;
  final String type;
  dynamic value;

  FormField(
      {required this.id, required this.label, required this.type, this.value});
}
