import '../constants.dart';

abstract class MarkFormField {
  final String id;
  final String label;
  final String type;
  final String iconPath;

  dynamic value;
  
  String get defaultIconPath => Constants.iconRename;

  MarkFormField(
      {required this.id,
      required this.label,
      required this.type,
      this.iconPath = Constants.iconRename,
      this.value});
}
