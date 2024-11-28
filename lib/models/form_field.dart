abstract class MarkFormField {
  final String id;
  final String label;
  final String type;
  dynamic value;

  MarkFormField(
      {required this.id, required this.label, required this.type, this.value});
}
