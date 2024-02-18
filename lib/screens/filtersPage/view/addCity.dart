

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internshala_submission/common/Common_Widget.dart';
import 'package:internshala_submission/screens/filtersPage/controller/selectionController.dart';

import '../../../AppDetails.dart';
import '../../../common/Common_Colors.dart';
import '../../../common/Common_TextFormField.dart';
import '../../../common/SizeConfig.dart';

class AddCityPage extends StatefulWidget {
  @override
  AddCityPageState createState() => AddCityPageState();

}

class AddCityPageState extends State<AddCityPage> {
  @override
  void initState() {
    super.initState();
    _filteredItems.value= selectProfileController.listOfCities.value;
    debugPrint('list of cities ${selectProfileController.listOfCities}');
  }


  SelectionController selectProfileController= Get.put(
      SelectionController());
  RxList<String> _filteredItems = <String>[].obs;
  TextEditingController textEditingController = TextEditingController();
  RxList<String> tempSelectedCities= <String>[].obs;



  void _filterList(String searchQuery) {
    setState(() {
      _filteredItems.value = selectProfileController.listOfCities.value
          .where(
              (item) => item.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
      debugPrint('list of cities ${selectProfileController.listOfCities}');
    });
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 15, 15, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back,
                              color: HexColor("#5D5D5A"),
                            ),
                          ),
                          const SizedBox(width: 10.0,),
                          textWidget(
                            text: "City",
                            fontWeight: FontWeight.bold,
                            fontFamily: AppDetails.fontPoppinsBold,
                            fontSize: 18.0,
                            color:
                            HexColor(CommonColors.onBoardingTitleColor),
                          ),
                          SizedBox(width: SizeConfig.screenWidth*0.16,),
                          CommonButton(
                            width: SizeConfig.screenWidth * 0.35,
                            height: SizeConfig.screenHeight*0.05,
                            onPressed: () {
                              setState(() {
                                selectProfileController.selectedCities.clear();
                              });
                            },
                            buttonText: "Clear all",
                            borderRadius: 5.0,
                            buttonColor: CommonColors.whiteColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            buttonFontFamily: AppDetails.fontPoppinsBold,
                            fontColor: CommonColors.appPrimaryColor,
                          ),
                          CommonButton(
                            width: SizeConfig.screenWidth * 0.25,
                            height: SizeConfig.screenHeight*0.05,
                            onPressed: () {
                              for(String profile in tempSelectedCities.value)
                              {
                                if(!(selectProfileController.selectedCities.contains(profile)))
                                {
                                  selectProfileController.selectedCities.value.add(profile);
                                }
                              }
                              Navigator.pop(context);
                            },
                            buttonText: "Apply",
                            borderRadius: 5.0,
                            buttonColor: CommonColors.appPrimaryColor,
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            buttonFontFamily: AppDetails.fontPoppinsBold,
                            fontColor: CommonColors.whiteColor,
                          )
                        ],
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 45,
                    width: SizeConfig.screenWidth*0.95,
                    child: CommonNormalWithFocusTextFormField(
                      controller: textEditingController,
                      hintText: "Search city".tr,
                      textInputAction: TextInputAction.search,
                      keyboardType: TextInputType.text,
                      validator: (value) {},
                      onChanged: _filterList, focusNode: null,
                      // prefixIcon: Icon(
                      //   Icons.search,
                      //   size: 20,
                      //   color: HexColor(CommonColors.splashColor),
                      // ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight*0.7,
                  child: Obx(() => ListView.builder(
                    shrinkWrap: true,
                    itemCount: _filteredItems.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          if(tempSelectedCities.value.contains(_filteredItems.value[index]))
                          {
                            setState(() {
                              tempSelectedCities.value.remove(_filteredItems.value[index]);
                            });
                          }
                          else
                          {
                            setState(() {
                              tempSelectedCities.value.add(_filteredItems.value[index]);
                            });
                          }
                        },
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 0.0, bottom: 0.0),
                          visualDensity: const VisualDensity(
                              horizontal: -4.0, vertical: -4.0),
                          title: textWidget(
                            text: _filteredItems[index].toString(),
                            // text:'Filter 1',
                            fontWeight: FontWeight.normal,
                            fontFamily: AppDetails.fontPoppinsRegular,
                            fontSize: 14,
                            color: HexColor(
                                CommonColors.listTileTitleSelectColor),
                          ),
                          trailing: SizedBox(
                            height: 18.0,
                            width: 18.0,
                            child: Checkbox(
                              checkColor: HexColor(CommonColors.whiteColor),
                              value: (selectProfileController.selectedCities.contains(_filteredItems.value[index]) ||tempSelectedCities.contains(_filteredItems.value[index]) )
                                  ? true
                                  : false,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(
                                  width: 0.5,
                                  color:
                                  HexColor(CommonColors.grayThreeColor),
                                ),
                              ),
                              activeColor: HexColor(CommonColors.appPrimaryColor),
                              onChanged: (value) {
                                if(selectProfileController.selectedCities.value.contains(_filteredItems.value[index]))
                                {
                                  setState(() {
                                    selectProfileController.selectedCities.value.remove(_filteredItems.value[index]);
                                  });
                                }
                                else
                                {
                                  setState(() {
                                    selectProfileController.selectedCities.value.add(_filteredItems.value[index]);
                                  });
                                }
                                if(int.parse(selectProfileController.selectedCities.length.toString())!=0)
                                {
                                  setState(() {
                                    selectProfileController.isSelectCityActive.value=true;
                                  });
                                }
                              },
                            ),
                          ),
                        ),
                      );
                    },
                  ),)
                ),


              ],
            ),
          ),
        )
    );
  }
}
