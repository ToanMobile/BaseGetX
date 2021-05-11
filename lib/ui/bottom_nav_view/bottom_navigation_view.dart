import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wefinex/base/base_view_view_model.dart';
import 'package:wefinex/shared/constant/common.dart';
import 'package:wefinex/ui/home/home_screen.dart';
import 'package:wefinex/ui/xoso/xoso_screen.dart';
import 'bottom_navigation_view_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

class BottomNavigationView extends BaseView<BottomNavigationViewController> {
  @override
  Widget vBuilder() => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            Common().string.title_app,
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: Obx(() => Theme(
              data: ThemeData(splashColor: Colors.transparent),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                fixedColor: Colors.lightBlue,
                backgroundColor: Colors.white,
                elevation: 15.0,
                currentIndex: controller.currentNavPageIndex,
                onTap: (index) {
                  controller.currentNavPageIndex = index;
                },
                items: controller.bottomNavigationBarItems,
              ),
            )),
        body: Obx(
          () => IndexedStack(
            index: controller.currentNavPageIndex,
            children: [
              HomeScreen(),
              XoSoScreen(),
              XoSoScreen(),
            ],
          ),
        ),
      );
}
