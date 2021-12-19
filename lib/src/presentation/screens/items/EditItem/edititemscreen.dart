import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:resturant_side/src/presentation/constatns/colors.dart';
import 'package:resturant_side/src/presentation/constatns/exporter.dart';
import 'package:resturant_side/src/presentation/constatns/paadings.dart';
import 'package:resturant_side/src/presentation/constatns/spaces.dart';
import 'package:resturant_side/src/presentation/screens/categories/categories.dart';
import 'package:resturant_side/src/presentation/screens/items/additems/additem.dart';
import 'package:resturant_side/src/presentation/screens/items/additems/additemcompo/vegnonveg.dart';
import 'package:resturant_side/src/presentation/screens/items/additems/expandabletoggle.dart';
import 'package:resturant_side/src/presentation/widgets/appbar.dart';
import 'package:resturant_side/src/presentation/widgets/dropdownbox.dart';
import 'package:resturant_side/src/presentation/widgets/masterbutton.dart';
import 'package:resturant_side/src/presentation/widgets/mastertextfield.dart';
import 'package:resturant_side/src/presentation/widgets/timetoggle.dart';
import 'package:resturant_side/src/utils/navigationutil.dart';

class EditItem extends StatefulWidget {
  const EditItem({Key? key, required this.image}) : super(key: key);
  final String image;
  @override
  State<EditItem> createState() => _EditItemState();
}

class _EditItemState extends State<EditItem> {
  Set<String> categories = {'Select', 'Lunch', 'Dinner', 'BreakFast'};
  String selctted = 'Select';
  late TextEditingController _nameController, _itemCode, _itemNo, _itemDesc;
  late ScrollController _scrollController;
  @override
  void initState() {
    _scrollController = ScrollController(initialScrollOffset: 205);

    _nameController = TextEditingController(text: 'Tomato Spaghetti');

    _itemCode = TextEditingController(text: 'HKD6562');
    _itemNo = TextEditingController(text: '56');
    _itemDesc = TextEditingController(
        text:
            'Lorem ipsum dolor sit amet consectetur adipisicing elit. In deserunt eligendi corporis explicabo consequuntur autem minus tempore. Aut, nam quae.');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 15),
        child: MasterButton(
            onTap: () {
              Navigator.pop(context);
            },
            tittle: 'Save'),
      ),
      appBar: buildAppBar(context, tittle: 'Edit Item'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: KPadding.kp24),
        child: ListView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          children: [
            SpaceUtils.ks24.height(),
            MasterTextField(
              tittle: 'Item Name',
              controller: _nameController,
            ),
            SpaceUtils.ks24.height(),
            Row(
              children: [
                Expanded(
                  child: MasterTextField(
                    tittle: 'Item Code',
                    controller: _itemCode,
                  ),
                ),
                SpaceUtils.ks18.width(),
                Expanded(
                  child: MasterTextField(
                    tittle: 'Item No.',
                    controller: _itemNo,
                  ),
                ),
              ],
            ),
            SpaceUtils.ks24.height(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Choose Category',
                    style: FontStyleUtilities.h6(fontWeight: FWT.semiBold)),
                SpaceUtils.ks10.height(),
                Row(
                  children: [
                    Expanded(
                      child: DropDownBox(
                          height: 48,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: ColorUtils.kcBlueButton, width: 1),
                              borderRadius: BorderRadius.circular(8)),
                          width: double.infinity,
                          item: const ['Lunch', 'BreakFast', 'Dinner'],
                          value: (va) {}),
                    ),
                    SpaceUtils.ks10.width(),
                    GestureDetector(
                      onTap: () {
                        navigateToPage(context, page: const Categories());
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    )
                  ],
                )
              ],
            ),
            SpaceUtils.ks24.height(),
            MasterTextField(
              controller: _itemDesc,
              tittle: 'Item Description',
              height: 48 * 3,
              maxLines: 5,
            ),
            SpaceUtils.ks18.height(),
            GestureDetector(
              child: Container(
                height: 150,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "asset/tempimages/temp/placeholder.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: ColorUtils.kcTransparent.withOpacity(.13),
                          offset: const Offset(0, 4),
                          blurRadius: 10)
                    ]),
              ),
            ),
            SpaceUtils.ks7.height(),
            Text(
              'Select Source',
              style: FontStyleUtilities.h6(fontWeight: FWT.bold),
            ),
            SpaceUtils.ks7.height(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.image,
                          color: ColorUtils.kcPrimary,
                          size: 35,
                        ),
                      ),
                    ),
                    Text(
                      'Gallery',
                      style: FontStyleUtilities.t3(
                        fontWeight: FWT.semiBold,
                      ),
                    )
                  ],
                ),
                SpaceUtils.ks10.width(),
                Column(
                  children: [
                    SizedBox(
                      height: 35,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_enhance_outlined,
                          color: ColorUtils.kcPrimary,
                          size: 35,
                        ),
                      ),
                    ),
                    Text(
                      'Camera',
                      style: FontStyleUtilities.t3(
                        fontWeight: FWT.semiBold,
                      ),
                    )
                  ],
                ),
              ],
            ),
            SpaceUtils.ks30.height(),
            ExpandableToggleTile(
                initialValue: true,
                onChanged: () {},
                name: 'Size Customization',
                child: const TheExpandableWidget(
                  name: 'Set the size customization count',
                )),
            ExpandableToggleTile(
                initialValue: true,
                name: 'Choice Options',
                child: const TheExpandableWidget(
                  name: 'Choice Limit UpTO',
                ),
                onChanged: () {}),
            ExpandableToggleTile(
                initialValue: true,
                name: 'Add Ons',
                child: const TheExpandableWidget(
                  name: 'Number of Add Ons',
                ),
                onChanged: () {}),
            ExpandableToggleTile(
                initialValue: true,
                name: 'Assign Label',
                child: Column(
                  children: [
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Expanded(
                            child: DropDownBox(
                                width: double.infinity,
                                item: const [
                                  'Must Try',
                                  'Something New',
                                  'Some Spicy',
                                  'Amazing'
                                ],
                                value: (v) {})),
                        SpaceUtils.ks30.width(),
                        GestureDetector(
                          onTap: () {},
                          child: const CircleAvatar(
                              radius: 18,
                              child: Icon(Icons.add),
                              foregroundColor: ColorUtils.kcWhite),
                        )
                      ],
                    ),
                  ],
                ),
                onChanged: () {}),
            TimeToggle(name: 'Set Automatic Time', from: (v) {}, to: (v) {}),
            SpaceUtils.ks18.height(),
            const VegNonVeg(),
            SpaceUtils.ks60.height(),
            Text(
              'Available',
              textAlign: TextAlign.center,
              style: FontStyleUtilities.h4(fontWeight: FWT.semiBold),
            ),
            SpaceUtils.ks18.height(),
            BigToggleSwitch(
              onChange: (value) {},
              initialvalue: true,
            ),
            SpaceUtils.ks24.height()
          ],
        ),
      ),
    );
  }
}
