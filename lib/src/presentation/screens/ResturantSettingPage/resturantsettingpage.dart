import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/widgets/appbar.dart';
import 'package:resturant_side/src/presentation/widgets/masterbutton.dart';
import 'package:resturant_side/src/presentation/widgets/mastertextfield.dart';
import 'package:resturant_side/src/repository/itemrepo.dart';
import 'package:resturant_side/src/utils/iconutil.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

class RestaurantSetting extends StatelessWidget {
  const RestaurantSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, tittle: 'Restaurant'),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 10, left: 24, right: 24, top: 10),
        child: MasterButton(
            onTap: () {
              popToTheHome(context);
            },
            tittle: 'Save'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  child: Stack(
                    fit: StackFit.passthrough,
                    children: [
                      Positioned(
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: double.infinity,
                          height: 253,
                          child: Image.asset(
                            'asset/tempimages/temp/placeholder.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                          width: MediaQuery.of(context).size.width,
                          bottom: 0,
                          child: const RestaurantInfo()),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 130 + 295,
                ),
                SpaceUtils.ks20.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 024),
                  child: StaggeredGridView.countBuilder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      itemCount: itmes.length,
                      itemBuilder: (context, int index) => StaggeredContainer(
                            child: Image.asset(
                              'asset/tempimages/temp/placeholder.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                      staggeredTileBuilder: (index) => StaggeredTile.count(
                          (index % 10 == 0) ? 2 : 1,
                          (index % 10 == 0) ? 2 : 1)),
                ),
                SpaceUtils.ks16.height(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const MasterTextField(tittle: 'Facebook Link'),
                      SpaceUtils.ks18.height(),
                      const MasterTextField(tittle: 'Instagram Link'),
                      SpaceUtils.ks18.height(),
                      const MasterTextField(tittle: 'Twitter Link'),
                      SpaceUtils.ks30.height(),
                    ],
                  ),
                ),
                SpaceUtils.ks30.height()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RestaurantInfo extends StatelessWidget {
  const RestaurantInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(21),
      child: Column(children: [
        Text("Restaurant Name",
            style: FontStyleUtilities.h4(fontWeight: FWT.bold)),
        SpaceUtils.ks10.height(),
        const RestaurantStatus(),
        SpaceUtils.ks16.height(),
        Text('Restaurant',
            style: FontStyleUtilities.t2(fontWeight: FWT.semiBold)),
        const SizedBox(height: 4),
        Text(
          'Address will display here',
          style: FontStyleUtilities.t2(fontWeight: FWT.semiBold),
        ),
        const SizedBox(height: 4),
        Text('Expertise 1 . Expertise 2',
            style: FontStyleUtilities.t2(fontWeight: FWT.bold)),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            SimpleIconWrapper(name: 'Call', image: IconUtil.call),
            SimpleIconWrapper(name: 'Location', image: IconUtil.location),
            SimpleIconWrapper(name: 'Opening', image: IconUtil.add)
          ],
        )
      ]),
      width: double.infinity,
      height: 295,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: ColorUtils.kcTransparent.withOpacity(.16),
            offset: const Offset(0, 4),
            blurRadius: 8)
      ], color: ColorUtils.kcWhite, borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(horizontal: 24),
    );
  }
}

class RestaurantStatus extends StatefulWidget {
  const RestaurantStatus({
    Key? key,
  }) : super(key: key);

  @override
  State<RestaurantStatus> createState() => _RestaurantStatusState();
}

class _RestaurantStatusState extends State<RestaurantStatus> {
  bool isOpen = true;
  toggle() {
    isOpen = !isOpen;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
              color: isOpen ? ColorUtils.kcGreenColor : ColorUtils.kcPrimary,
              width: 1.5)),
      height: 30,
      child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            toggle();
          },
          child: Text(isOpen ? 'STATUS: OPEN' : 'STATUS: CLOSE',
              style: FontStyleUtilities.t2(
                  fontWeight: FWT.semiBold,
                  fontColor: isOpen
                      ? ColorUtils.kcGreenColor
                      : ColorUtils.kcPrimary))),
    );
  }
}

class StaggeredContainer extends StatelessWidget {
  const StaggeredContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      child: child,
      decoration: BoxDecoration(
          color: ColorUtils.kcWhite,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: ColorUtils.kcTransparent.withOpacity(.16),
              offset: const Offset(0, 3),
              blurRadius: 6,
            ),
          ]),
    );
  }
}

class SimpleIconWrapper extends StatelessWidget {
  const SimpleIconWrapper({Key? key, required this.image, required this.name})
      : super(key: key);
  final String image, name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorUtils.kcIconBackgroundColor.withOpacity(.70)),
          child: Center(
            child: SvgPicture.asset(image,
                color: ColorUtils.kcCallIconColor.withOpacity(.90)),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          name,
          style: FontStyleUtilities.t2(),
        )
      ],
    );
  }
}
