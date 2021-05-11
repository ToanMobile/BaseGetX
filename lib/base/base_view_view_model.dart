import 'package:flutter/material.dart';

import 'base_controller.dart';

export 'base_controller.dart';

/*
Created by ToanDev on 02/05/2021
Company: Netacom.
Email: hvtoan.dev@gmail.com
*/

/// [Example]
///
/// class MemberWidget extends BaseViewModel<MemberController> {
///
///   @override
///   Widget vmBuilder() => Text("Hi, I'm a member");
///
/// }
///
/// Please extends to your [ViewModel] / [Widget] / [Child].
/// read the [Example] above.
abstract class BaseViewModel<T extends BaseController> extends StatelessWidget {
  const BaseViewModel({required Key key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context){
    return Obx(()=>vmBuilder());
  }

  Widget vmBuilder();
}

/// [Example]
///
/// class HomeView extends BaseView<HomeController> {
///
///   @override
///   Widget vBuilder() => Scaffold(
///     appBar: AppBar(
///       title: Text("Title"),
///     ),
///     body: Container(
///       child: Center(
///         child: Text("Hello, world",
///           style: AppThemes().textTheme.bodyText1,
///         ),
///       ),
///     ),
///   );
///
/// }
///
/// RECOMENDED FOR you'r [Screen] / [View] / [Page].
/// Please extends to your [Screen] / [View] / [Page].
/// read the [Example] above.
abstract class BaseView<T extends BaseController> extends StatelessWidget {

  const BaseView({Key? key}) : super(key: key);

  final String? tag = null;
  T get controller => GetInstance().find<T>(tag: tag);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<T>(
      builder: (controller){
        return vBuilder();
      },
    );
  }

  Widget vBuilder();
}