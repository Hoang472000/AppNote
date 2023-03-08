import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/view/create_or_edit_page.dart';

import '../data/entity/note_entity.dart';
import '../data/repository.dart';
import '../generated/l10n.dart';
import '../resource/color.dart';
import '../resource/style.dart';
import '../utils/utils.dart';
import '../utils/widgets/bkav_app_bar.dart';
import '../utils/widgets/card_movie.dart';
import '../view_model/note/note_bloc.dart';
import 'detail_note_page.dart';

class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  static Route route() {
    return Utils.pageRouteBuilder(const NotePage(), true);
  }

  @override
  State<NotePage> createState() => _NotePageState();
}

const List<Tab> tabs = <Tab>[
  Tab(text: 'Công việc'),
  Tab(text: 'Học tập'),
  Tab(text: 'Riêng tư'),
];

class _NotePageState extends State<NotePage> {
  int indexTab = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(
        repository: context.read<Repository>(),
      ),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: AppColor.background,
          appBar: CustomAppBar(
            context,
            showDefaultBackButton: false,
            title: Text("OverView",
                style: StyleBkav.textStyleFW500(Colors.black, 18)),
            bottom:  TabBar(
                onTap: (index) {
                  setState(() {
                    indexTab = index;
                  });
                },
                tabs: tabs),
          ),
          body: BlocConsumer<NoteBloc, NoteState>(
              listener: (context, state) {},
              builder: (context, state) {
                return const TabBarView(
                  children: [
                    DetailNotePage(categoryId: 0,),
                    DetailNotePage(categoryId: 1,),
                    DetailNotePage(categoryId: 2,)
                  ],
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              Navigator.of(context).push<void>(await CreateOrEditPage.route(categoryId: indexTab, isCreate: true));
            },
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
