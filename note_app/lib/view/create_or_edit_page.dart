import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/category.dart';

import '../data/entity/note_entity.dart';
import '../data/repository.dart';
import '../generated/l10n.dart';
import '../resource/color.dart';
import '../resource/style.dart';
import '../utils/utils.dart';
import '../utils/widgets/bkav_app_bar.dart';
import '../view_model/note/create_or_edit_bloc.dart';

class CreateOrEditPage extends StatefulWidget {
  const CreateOrEditPage(
      {Key? key, required this.categoryId, required this.isCreate})
      : super(key: key);
  final int categoryId;
  final bool isCreate;

  static Route route({required int categoryId, bool? isCreate}) {
    return Utils.pageRouteBuilder(
        CreateOrEditPage(
          categoryId: categoryId,
          isCreate: isCreate ?? false,
        ),
        true);
  }

  @override
  State<CreateOrEditPage> createState() => _CreateOrEditPageState();
}

Future<void> _selectDate(BuildContext context, BuildContext contextBloc,
    CreateOrEditState state) async {
  final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.parse((state.note ?? Note()).date ?? ""),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary:
                  AppColor.text, // header background color// body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      });
  if (picked != null &&
      picked != DateTime.parse((state.note ?? Note()).date ?? "")) {
    contextBloc
        .read<CreateOrEditBloc>()
        .add(OnChangeDateTime(Utils.formatDateToString(picked)));
  }
}

class _CreateOrEditPageState extends State<CreateOrEditPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateOrEditBloc(
        repository: context.read<Repository>(),
      ),
      child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: CustomAppBar(
            context,
            showDefaultBackButton: true,
            title: Text(widget.isCreate ? "Create Screen" : "Edit Screen",
                style: StyleBkav.textStyleFW500(Colors.black, 18)),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: widget.isCreate
                      ? const Icon(Icons.save)
                      : const Icon(Icons.edit)),
            ],
          ),
          body: BlocConsumer<CreateOrEditBloc, CreateOrEditState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            flex: 7,
                            //width: 230,
                            child: Container(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: FormField<String>(
                                    builder:
                                        (FormFieldState<String> stateFrom) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            labelText: "Danh mục:",
                                            errorStyle: const TextStyle(
                                                color: Colors.redAccent,
                                                fontSize: 16.0),
                                            hintText: 'Please select expense',
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 10.0,
                                                    horizontal: 10.0),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        5.0))),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton<Category>(
                                            value: state.category,
                                            isDense: true,
                                            isExpanded: true,
                                            onChanged: (Category? newValue) {
                                              context
                                                  .read<CreateOrEditBloc>()
                                                  .add(ChangeCategory(
                                                      newValue ??
                                                          Category(
                                                              0, "Công việc")));
                                            },
                                            items: state.listCategory
                                                .map((Category value) {
                                              return DropdownMenuItem<Category>(
                                                value: value,
                                                child: value.category.isEmpty
                                                    ? Container()
                                                    : Text(value.category,
                                                        style: StyleBkav
                                                            .textStyleFW400(
                                                                AppColor.text,
                                                                14,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      );
                                    },
                                  )),
                            ),
                          ),
                          Flexible(
                            flex: 5,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 0, top: 5, bottom: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    _selectDate(context, context, state);
                                  },
                                  child: FormField<String>(
                                    builder:
                                        (FormFieldState<String> stateFrom) {
                                      return InputDecorator(
                                          decoration: InputDecoration(
                                              labelText: "Ngày tạo:",
                                              errorStyle: const TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 16.0),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      top: 10.0,
                                                      left: 10.0,
                                                      bottom: 10.0),
                                              hintText: 'Please select expense',
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0))),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                (state.note ?? Note()).date ??
                                                    "",
                                                style: StyleBkav.textStyleFW400(
                                                    AppColor.text, 14),
                                              )),
                                              const Icon(
                                                Icons.calendar_month_outlined,
                                                size: 23,
                                              )
                                            ],
                                          ));
                                    },
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          hintText: "Title:",
                          labelText: "Title",
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          hintText: "Note content:",
                          labelText: "Note content",
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 16.0),
                        ),
                      ),
                    ),
                    Container(
                      child: FormField<String>(
                        builder:
                            (FormFieldState<String> stateFrom) {
                          return InputDecorator(
                            decoration: InputDecoration(
                                labelText: "Nhắc nhở:",
                                errorStyle: const TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 16.0),
                                hintText: 'Please select expense',
                                contentPadding:
                                const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 10.0),
                                /*border: OutlineInputBorder(
                                    borderRadius:
                                    BorderRadius.circular(
                                        5.0))*/),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: (state.note??Note()).isNote?? true
                                    ?state.listString[0]:state.listString[1],
                                isDense: true,
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  context
                                      .read<CreateOrEditBloc>()
                                      .add(OnChangeString(
                                      newValue ??state.listString[0]));
                                },
                                items: state.listString
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: value.isEmpty
                                        ? Container()
                                        : Text(value,
                                        style: StyleBkav
                                            .textStyleFW400(
                                            AppColor.text,
                                            14,
                                            overflow:
                                            TextOverflow
                                                .ellipsis),
                                        maxLines: 1,
                                        overflow: TextOverflow
                                            .ellipsis),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        decoration: InputDecoration(
                          hintText: "Địa điểm:",
                          labelText: "Địa điểm",
                          errorStyle: const TextStyle(
                              color: Colors.redAccent, fontSize: 16.0)/*,border:InputBorder.none*/
                        ),
                      ),
                    ),
                  ],
                );
              })),
    );
  }
}
