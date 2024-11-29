import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_forms/constants.dart';
import 'package:smart_forms/models/form_field.dart';
import 'package:smart_forms/presentation/components/draggable_input.dart';
import 'package:smart_forms/presentation/components/text.dart';

class FormFieldListItem extends StatelessWidget {
  final MarkFormField field;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  final int index;

  const FormFieldListItem({
    super.key,
    required this.field,
    required this.onEdit,
    required this.onDelete,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: DraggableInput(
        leading: Row(
          children: [
            ReorderableDragStartListener(
                index: index,
                child: const Icon(Icons.drag_indicator_sharp,
                    color: Constants.gray600)),
            SizedBox(
              width: 28,
              height: 28,
              child: Center(
                child: SvgPicture.asset(
                  field.iconPath,
                  height: 16,
                  width: 16,
                ),
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.more_horiz, color: Constants.gray800),
          onPressed: onDelete,
        ),
        child: GestureDetector(
          onTap: onEdit,
          child: TextBase(field.label),
        ),
      ),
    );
  }
}
