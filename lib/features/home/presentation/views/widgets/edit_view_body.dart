import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/convert_time_of_day_to_date_time.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/helper_function/format_time.dart';
import 'package:zen_tasker/core/helper_function/is_tablet.dart';
import 'package:zen_tasker/core/helper_function/open_date_picker.dart';
import 'package:zen_tasker/core/helper_function/open_time_picker.dart';
import 'package:zen_tasker/core/models/task_model.dart';
import 'package:zen_tasker/core/widgets/custom_button.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/lable_date_and_time_text_field.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/lable_text_form_field.dart';
import 'package:zen_tasker/features/home/presentation/managers/fetch_tasks_cubit/fetch_tasks_cubit.dart';
import 'package:zen_tasker/features/home/presentation/managers/update_task_cubit/update_task_cubit.dart';
import 'package:zen_tasker/generated/l10n.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.taskModel});

  final TaskModel taskModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  late String title, date, time, description;

  @override
  void initState() {
    dateController.text =
        formatDate(date: DateTime.parse(widget.taskModel.date));
    timeController.text =
        formatTime(dateTime: DateTime.parse(widget.taskModel.time));
    titleController.text = widget.taskModel.title;
    descriptionController.text = widget.taskModel.description;
    title = widget.taskModel.title;
    date = widget.taskModel.date;
    time = widget.taskModel.time;
    description = widget.taskModel.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding, vertical: 8),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  if (!isMobile(context))
                    const SizedBox(
                      height: 16,
                    ),
                  LableTextFormField(
                    title: S.of(context).title,
                    controller: titleController,
                    hintText: S.of(context).hintTitle,
                    maxLines: 1,
                    textInputType: TextInputType.text,
                    messageValidate: S.of(context).titleIsRequired,
                    onSaved: (value) {
                      title = value!;
                    },
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LableDateAndTimeTextField(
                          title: S.of(context).date,
                          hintText: formatDate(date: DateTime.now()),
                          controller: dateController,
                          messageValidate: S.of(context).dateIsRequired,
                          onTap: () async {
                            DateTime? datePicked = await openDatePicker(context,
                                initialDate: DateTime.parse(date));
                            if (datePicked != null) {
                              setState(() {
                                date = datePicked.toString();
                                dateController.text =
                                    formatDate(date: datePicked);
                              });
                            }
                          },
                          onSaved: (value) {
                            // date = value!;
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: LableDateAndTimeTextField(
                          title: S.of(context).time,
                          hintText: formatTime(
                            dateTime: DateTime.now(),
                          ),
                          controller: timeController,
                          messageValidate: S.of(context).timeIsRequired,
                          onTap: () async {
                            TimeOfDay? timePicked = await openTimePicker(
                                context,
                                initialTime: DateTime.parse(time));
                            if (timePicked != null) {
                              DateTime dateTime =
                                  convertTimeOfDayToDateTime(time: timePicked);
                              setState(() {
                                time = dateTime.toString();
                                timeController.text = dateTime.toString();
                              });
                            }
                          },
                          onSaved: (value) {
                            // time = value!;
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  LableTextFormField(
                    title: S.of(context).description,
                    controller: descriptionController,
                    hintText: S.of(context).hintDescription,
                    textInputType: TextInputType.multiline,
                    maxLines: null,
                    backgroundColor: Colors.white,
                    messageValidate: S.of(context).descriptionIsRequired,
                    onSaved: (value) {
                      description = value!;
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        widget.taskModel.title = title;
                        widget.taskModel.date = date;
                        widget.taskModel.time = time;
                        widget.taskModel.description = description;
                        context
                            .read<UpdateTaskCubit>()
                            .updateTask(taskModel: widget.taskModel);

                        context.read<FetchTasksCubit>().fetchAllTasks();
                        Navigator.pop(context);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: S.of(context).edit,
                  ),
                  if (!isMobile(context)) const Spacer(),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
