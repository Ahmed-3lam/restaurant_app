import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/screens/Settings/settings.dart';
import 'package:resturant_side/src/presentation/screens/notification/notification.dart';
import 'package:resturant_side/src/presentation/widgets/customiconbutton.dart';
import 'package:resturant_side/src/utils/iconutil.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

import 'compo/customers.dart';
import 'compo/mybarchart.dart';
import 'compo/top5.dart';
import 'compo/totalorders.dart';
import 'compo/totalstats.dart';

class Stats extends StatefulWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController(initialScrollOffset: 57);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Stats',
              style: FontStyleUtilities.h4(
                fontWeight: FWT.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorUtils.kcWhite,
        leading: CustomIconButton(
          size: 20,
          onTap: () {
            navigateToPage(context, page: const SettingsPage());
          },
          child: SvgPicture.asset(
            IconUtil.menu,
            height: 20,
          ),
        ),
        actions: [
          CustomIconButton(
              onTap: () {
                navigateToPage(context, page: const NotificationPage());
              },
              child: SvgPicture.asset(IconUtil.bell)),
          SpaceUtils.ks24.width()
        ],
      ),
      body: SingleChildScrollView(
        controller: _controller,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SpaceUtils.ks10.height(),
            const MyBarChartData(),
            const TotalOrders(),
            const Customers(),
            const TotalStats(),
            const Top5(),
            SpaceUtils.ks30.height(),
            SpaceUtils.ks120.height(),
          ],
        ),
      ),
    );
  }
}
