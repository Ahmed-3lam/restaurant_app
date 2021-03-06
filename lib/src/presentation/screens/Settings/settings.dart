import 'package:flutter/material.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/screens/Holidays/Holidays/holidays.dart';
import 'package:resturant_side/src/presentation/screens/LoyaltyProgram/loyaltyprogram.dart';
import 'package:resturant_side/src/presentation/screens/ManageTeam/ManageTeam/mangeteammembers.dart';
import 'package:resturant_side/src/presentation/screens/ResturantSettingPage/resturantsettingpage.dart';
import 'package:resturant_side/src/presentation/screens/Tables/tables.dart';
import 'package:resturant_side/src/presentation/screens/authentication/login/login.dart';
import 'package:resturant_side/src/presentation/screens/automatetiming/automatetiming.dart';
import 'package:resturant_side/src/presentation/screens/items/additems/additem.dart';
import 'package:resturant_side/src/presentation/screens/offers/Offers/offers.dart';
import 'package:resturant_side/src/presentation/widgets/roletag.dart';
import 'package:resturant_side/src/presentation/widgets/widgetexporter.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: ColorUtils.kcBlack,
          centerTitle: true,
          backgroundColor: ColorUtils.kcWhite,
          elevation: 0,
          title: Text(
            'Settings',
            style: FontStyleUtilities.h3(fontWeight: FWT.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpaceUtils.ks30.height(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'Zack Foster',
                  style: FontStyleUtilities.h3(fontWeight: FWT.bold),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: RoleManger(
                  roleName: RoleName.ADMIN,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AddItemToggleTile(name: 'OPEN', onChange: (value) {}),
              ),
              SettingTile(
                  name: 'Automate Timing',
                  onTap: () {
                    navigateToPage(context, page: const AutoMateTiming());
                  }),
              SettingTile(
                  name: 'Offers',
                  onTap: () {
                    navigateToPage(context, page: const Offers());
                  }),
              SettingTile(
                  name: 'Loyalty Program',
                  onTap: () {
                    navigateToPage(context, page: const LoyaltyProgram());
                  }),
              SettingTile(
                  name: 'Table',
                  onTap: () {
                    navigateToPage(context, page: const Tables());
                  }),
              SettingTile(
                  name: 'Team',
                  onTap: () {
                    navigateToPage(context, page: const ManageTeamMember());
                  }),
              SettingTile(
                  name: 'About Restaurant',
                  onTap: () {
                    navigateToPage(context, page: const RestaurantSetting());
                  }),
              SettingTile(
                  name: 'Holidays',
                  onTap: () {
                    navigateToPage(context, page: const Holidays());
                  }),
              SpaceUtils.ks40.height(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: MasterButton(
                        onTap: () {
                          navigateToPage(context, page: const Login());
                        },
                        tittle: 'LOG OUT',
                        isOutlined: true,
                      ),
                    ),
                    const Expanded(child: SizedBox())
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

class SettingTile extends StatelessWidget {
  const SettingTile({Key? key, required this.name, required this.onTap})
      : super(key: key);
  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: MaterialButton(
        onPressed: onTap,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(name, style: FontStyleUtilities.h6(fontWeight: FWT.semiBold)),
            const RotatedBox(
                quarterTurns: 2,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ))
          ],
        ),
      ),
    );
  }
}
