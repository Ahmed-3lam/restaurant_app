import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/screens/LoyaltyProgram/loyaltyprogram.dart';
import 'package:resturant_side/src/presentation/screens/Settings/settings.dart';
import 'package:resturant_side/src/presentation/screens/notification/notification.dart';
import 'package:resturant_side/src/presentation/screens/offers/Offers/offers.dart';
import 'package:resturant_side/src/presentation/widgets/commonshadowcontainer.dart';
import 'package:resturant_side/src/presentation/widgets/customiconbutton.dart';
import 'package:resturant_side/src/utils/iconutil.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

class Customers extends StatelessWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Customers',
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
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SpaceUtils.ks20.height(),
            ListView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 8,
              itemBuilder: (BuildContext context, int index) {
                return const CustomerOfferTile();
              },
            ),
            SpaceUtils.ks120.height(),
          ],
        ),
      ),
    );
  }
}

class CustomerOfferTile extends StatelessWidget {
  const CustomerOfferTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonShadowContainer(
      margin: const EdgeInsets.only(left: 24, right: 24, top: 18),
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Customer Name',
                  style: FontStyleUtilities.t2(fontWeight: FWT.semiBold)),
              Text('+1 123456789',
                  style: FontStyleUtilities.t2(fontWeight: FWT.bold)),
              SpaceUtils.ks30.height(),
              Text('Ordered 23 times',
                  style: FontStyleUtilities.t2(fontWeight: FWT.bold)),
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 30,
            child: TextButton(
                onPressed: () {
                  navigateToPage(context, page: const Offers());
                },
                child: Text(
                  'Send Offer',
                  style: FontStyleUtilities.t2(
                      fontWeight: FWT.medium, fontColor: ColorUtils.kcPrimary),
                )),
          )
        ],
      ),
    );
  }
}
