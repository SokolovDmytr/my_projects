//import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
//import 'package:base_project_template/services/dialog_service/dialog_service.dart';
//import 'package:base_project_template/services/dialog_service/dialogs/exit_dialog/exit_dialog.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//class ExitDialogWidget extends StatelessWidget {
//  final ExitDialog dialogModel;
//
//  ExitDialogWidget(this.dialogModel) : super(key: Key('ExitDialogWidget'));
//
//  @override
//  Widget build(BuildContext context) {
//    //final TextDirection directionality = StorageLanguageSelector.selectedLocaleDirection(StoreProvider.of(context));
//    return DialogLayout(
//      child: Padding(
//        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          children: <Widget>[
//            Container(
//              //alignment: directionality == TextDirection.rtl ? Alignment.topLeft : Alignment.topRight,
//              alignment: Alignment.topRight,
//              child: DialogCloseButton(
//                keyValue: '1234',
//              ),
//            ),
//            SizedBox(
//              height: 50.sp,
//              child: SVGImages().mcLogo(),
//            ),
//            Container(
//              padding: EdgeInsets.all(16.sp),
//              child: Text(
//                'Exit Text',
//                textAlign: TextAlign.center,
//                style: CustomTheme.textStyles.titleTextStyle(size: 22.sp),
//              ),
//            ),
//            DialogMainButton(
//              keyValue: '12345',
//              backgroundColor: CustomTheme.colors.primaryColor,
//              textColor: CustomTheme.colors.background,
//              title: 'Yes',
//              onTap: () => SystemNavigator.pop(),
//            ),
//            SizedBox(
//              height: 16.h,
//            ),
//            DialogMainButton(
//              keyValue: '123456',
//              backgroundColor: CustomTheme.colors.background,
//              textColor: CustomTheme.colors.primaryColor,
//              title: 'No',
//              onTap: () => DialogService.instance.close(),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
