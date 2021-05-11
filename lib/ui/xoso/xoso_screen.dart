import 'package:flutter/material.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/routes/app_pages.dart';
import 'package:wefinex/shared/constant/common.dart';

import 'xoso_binding.dart';

/*
Created by ToanDev on 04/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class XoSoScreen extends BaseView<XoSoController> {
  @override
  Widget vBuilder() => Scaffold(
        body: _body(),
      );

  _body() {
    if (controller.screenStateIsLoading) return Center(child: CircularProgressIndicator());
    if (controller.screenStateIsError) return Text(Common().string.error_message);
    if (controller.screenStateIsOK)
      return ListView.builder(
        itemCount: controller.listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: buildWidgetTitle(controller.listData[index].name),
              leading: buildWidgetIcon(controller.listData[index].icon),
              trailing: buildWidgetIconRight(),
              contentPadding: EdgeInsets.all(5.0),
              onTap: () async {
                Get.toNamed(Routes.WEB_VIEW.replaceFirst(":link", "an-giang-xsag.rss"));
              },
            ),
          );
        },
      );
  }

  buildWidgetTitle(title) => Text(
        title,
        style: Common().textStyle.styleBold18White,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      );

  buildWidgetIcon(imageUrl) => Container(
        height: 50,
        width: 70,
        child: Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Image.asset(Common().assetsImage.icon_soxo_path + imageUrl),
        ),
      );

  buildWidgetIconRight() => Icon(
        Icons.keyboard_arrow_right,
        color: Colors.grey,
        size: 30.0,
      );
}
