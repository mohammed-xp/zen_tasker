import 'package:flutter/material.dart';
import 'package:zen_tasker/constants.dart';
import 'package:zen_tasker/core/helper_function/format_date.dart';
import 'package:zen_tasker/core/helper_function/format_time.dart';
import 'package:zen_tasker/core/widgets/custom_button.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/lable_date_and_time_text_field.dart';
import 'package:zen_tasker/features/create_task/presentation/views/widgets/lable_text_form_field.dart';
import 'package:zen_tasker/generated/l10n.dart';

class CreateTaskViewBody extends StatefulWidget {
  const CreateTaskViewBody({super.key});

  @override
  State<CreateTaskViewBody> createState() => _CreateTaskViewBodyState();
}

class _CreateTaskViewBodyState extends State<CreateTaskViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  String? title, description, date, time;

  @override
  void initState() {
    // dateController.text = formatDate(date: DateTime.now());
    // timeController.text = formatTime(time: DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        // shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                children: [
                  LableTextFormField(
                    title: S.of(context).title,
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
                            var datePicked = await _selectDate(context);
                            if (datePicked != null) {
                              setState(() {
                                date = datePicked.toString();
                                dateController.text =
                                    formatDate(date: datePicked);
                              });
                            }
                          },
                          onSaved: (value) {
                            date = value!;
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
                              time: TimeOfDay.fromDateTime(DateTime.now())),
                          controller: timeController,
                          messageValidate: S.of(context).timeIsRequired,
                          onTap: () async {
                            var timePicked = await _selectTime(context);
                            if (timePicked != null) {
                              setState(() {
                                time = timePicked.toString();
                                timeController.text =
                                    formatTime(time: timePicked);
                              });
                            }
                          },
                          onSaved: (value) {
                            date = value!;
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
                    onPressed: () {},
                    text: S.of(context).addTask,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
          // SliverFillRemaining(
          //   hasScrollBody: false,
          //   child: CustomButton(
          //     onPressed: () {},
          //     text: S.of(context).addTask,
          //   ),
          // ),
        ],
      ),
    );
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date == null ? DateTime.now() : DateTime.parse(date!),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    return picked;
  }

  Future<TimeOfDay?> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    return pickedTime;
  }
}
