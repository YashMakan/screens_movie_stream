import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MultiDeviceScaffold extends StatelessWidget {
  final Widget mobileScaffold;
  final Widget desktopScaffold;
  const MultiDeviceScaffold({super.key, required this.mobileScaffold, required this.desktopScaffold});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, _) {
      if(Device.screenType == ScreenType.mobile) {
        return mobileScaffold;
      } else {
        return desktopScaffold;
      }
    });
  }
}
