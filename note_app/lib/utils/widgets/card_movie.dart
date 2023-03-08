
import 'package:flutter/material.dart';

import '../../data/entity/note_entity.dart';
import '../../resource/color.dart';
import '../utils.dart';
import 'circle_text_wrapper.dart';

class CardMovie {
  static Widget cardMovie(Note move, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Stack(
        children: [
        /*  Container(
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.all(Radius.circular(8)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.5,
                  blurRadius: 7.0,
                  offset: Offset(0, 10), // changes position of shadow
                ),
              ],
            ),
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl: Utils.convertUrlImage(move.posterPath ?? ""),
              errorWidget: (context, url, error) => const Icon(
                Icons.person,
                fill: 1,
              ),
            ),
          ),*/
          Positioned(
              top: 20,
              right: 20,
              child: Container(
                child: CircleTextWrapper(
                  radius: 5,
                  text: "${move.categoryId}",
                ),
              )),
          Positioned.fill(
              top: 200,
              bottom: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.text.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              )),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    Utils.convertTime(move.date ?? ""),
                    style: TextStyle(
                        color: Colors.white, fontSize: 14, height: 1.5),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Text(
                    "${(move.title ?? "").toUpperCase()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
