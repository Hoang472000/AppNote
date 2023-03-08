import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/entity/note_entity.dart';
import '../data/repository.dart';
import '../generated/l10n.dart';
import '../resource/color.dart';
import '../resource/style.dart';
import '../utils/utils.dart';
import '../utils/widgets/bkav_app_bar.dart';
import '../utils/widgets/card_movie.dart';
import '../view_model/note/note_bloc.dart';

class DetailNotePage extends StatefulWidget {
  const DetailNotePage({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;
  static Route route(int categoryId) {
    return Utils.pageRouteBuilder( DetailNotePage(categoryId: categoryId,), true);
  }

  @override
  State<DetailNotePage> createState() => _DetailNotePageState();
}

class _DetailNotePageState extends State<DetailNotePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteBloc(
        repository: context.read<Repository>(),
      ),
      child: Scaffold(
          backgroundColor: AppColor.background,
          body: BlocConsumer<NoteBloc, NoteState>(
              listener: (context, state) {},
              builder: (context, state) {
                return NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification notification) {
                    if (notification.metrics.atEdge) {
                      if (notification.metrics.pixels == 0) {
                      } else {
                        if (!state.isHasUpdateList) {
                          context.read<NoteBloc>().add(GetListNote(false));
                        }
                      }
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                      onRefresh: () async {
                        context.read<NoteBloc>().add(GetListNote(true));
                      },
                      child: state.isShowProgress
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : Center(
                              child: Text("${widget.categoryId}"),
                            )),
                );
              })),
    );
  }
}
