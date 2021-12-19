import 'package:flutter/material.dart';

import 'package:resturant_side/src/extensions/heighextension.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/constatns/textstyle.dart';
import 'package:resturant_side/src/presentation/screens/Holidays/AddHoliday/addholiday.dart';
import 'package:resturant_side/src/presentation/widgets/commonshadowcontainer.dart';
import 'package:resturant_side/src/presentation/widgets/smallbutton.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

class Holidays extends StatelessWidget {
  const Holidays({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: ColorUtils.kcBlueButton,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Holidays',
              style: FontStyleUtilities.h4(
                fontWeight: FWT.medium,
              ),
            ),
            SpaceUtils.ks10.width(),
            GestureDetector(
              onTap: () {
                navigateToPage(context, page: const AddHoliday());
              },
              child: const CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.add),
                  foregroundColor: ColorUtils.kcWhite),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorUtils.kcWhite,
      ),
      body: Column(
        children: [
          SpaceUtils.ks30.height(),
          ListView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: holidays.length,
            itemBuilder: (BuildContext context, int index) {
              return HOlidayTIle(
                  holidayDate: holidays[index].date,
                  holidayName: holidays[index].name);
            },
          ),
        ],
      ),
    );
  }
}

class HOlidayTIle extends StatefulWidget {
  const HOlidayTIle({
    Key? key,
    required this.holidayDate,
    required this.holidayName,
  }) : super(key: key);
  final String holidayDate, holidayName;
  @override
  State<HOlidayTIle> createState() => _HOlidayTIleState();
}

class _HOlidayTIleState extends State<HOlidayTIle> {
  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 15),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.holidayDate,
                style: FontStyleUtilities.t2(fontWeight: FWT.medium),
              ),
              Text(
                widget.holidayName,
                style: FontStyleUtilities.t5(fontWeight: FWT.medium),
              )
            ],
          ),
          const Spacer(),
          SmallButton(
            name: 'Cancel',
            onTap: () {},
            color: ColorUtils.kcPrimary,
          )
        ],
      ),
    );
  }
}

class HolidayModel {
  HolidayModel({required this.date, required this.name});
  String date, name;
}

List<HolidayModel> holidays = [
  HolidayModel(date: '15th August 2021', name: 'Independence day'),
  HolidayModel(date: '2nd October 2021', name: 'Gandhi Jayanti'),
];
