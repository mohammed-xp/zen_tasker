import 'package:flutter/material.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/lable_text_form_field.dart';
import 'package:zen_tasker/generated/l10n.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LableTextFormField(
          title: S.of(context).title,
          hintText: S.of(context).hintTitle,
          maxLines: 1,
          textInputType: TextInputType.text,
          messageValidate: S.of(context).titleIsRequired,
          onSaved: (value) {},
        ),
      ],
    );
  }
}
