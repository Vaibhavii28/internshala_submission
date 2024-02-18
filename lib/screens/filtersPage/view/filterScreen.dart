import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internshala_submission/common/Common_Widget.dart';
import 'package:internshala_submission/screens/filtersPage/view/addCity.dart';
import 'package:internshala_submission/screens/filtersPage/view/addProfile.dart';
import 'package:internshala_submission/screens/filtersPage/controller/selectionController.dart';

import '../../../AppDetails.dart';
import '../../../common/Common_Colors.dart';
import '../../../common/SizeConfig.dart';

class FilterPage extends StatefulWidget {
  @override
  FilterPageState createState() => FilterPageState();
}

class FilterPageState extends State<FilterPage> {
  @override
  void initState() {
    super.initState();
  }

  SelectionController selectionController = Get.put(
    SelectionController(),
  );


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CommonButton(
              borderSide: BorderSide(
                  width: 2.0, color: HexColor(CommonColors.appPrimaryColor)),
              width: SizeConfig.screenWidth * 0.4,
              onPressed: () {
                selectionController.selectedCities.clear();
                selectionController.selectedProfiles.clear();
                selectionController.selectedDuration.value=duration[Duration.choose]!;
                searchPageController.allFilters.clear();
                searchPageController.totalFilter();
                Navigator.pop(context);
              },
              buttonText: "Clear all",
              borderRadius: 5.0,
              buttonColor: CommonColors.whiteColor,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
              buttonFontFamily: AppDetails.fontPoppinsBold,
              fontColor: CommonColors.appPrimaryColor,
            ),
            CommonButton(
              width: SizeConfig.screenWidth * 0.4,
              onPressed: () {
                searchPageController.allFilters.clear();
                searchPageController.allFilters.addAll(selectionController.selectedProfiles);
                searchPageController.allFilters.addAll(selectionController.selectedCities);
                if(selectionController.selectedDuration.value!= duration[Duration.choose])
                  {
                    searchPageController.allFilters.add('${selectionController.selectedDuration.value} Months');
                  }
                searchPageController.totalFilter();
                debugPrint('all filters ${searchPageController.allFilters}');
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
      ),
      body: Container(
        child: SingleChildScrollView(
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
                        const SizedBox(
                          width: 10.0,
                        ),
                        textWidget(
                          text: "Filters",
                          fontWeight: FontWeight.bold,
                          fontFamily: AppDetails.fontPoppinsBold,
                          fontSize: 18.0,
                          color: HexColor(CommonColors.onBoardingTitleColor),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                color: HexColor(CommonColors.inLineBorder),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textWidget(
                      text: "PROFILE",
                      color:
                          HexColor(CommonColors.greyTextColor).withOpacity(0.8),
                      fontSize: 12.0,
                      fontFamily: AppDetails.fontPoppinsRegular,
                      fontWeight: FontWeight.normal,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddProfilePage()));
                        setState(() {

                        });
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: HexColor(CommonColors.appPrimaryColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          textWidget(
                            text: "Add Profile",
                            color: HexColor(CommonColors.appPrimaryColor),
                            fontSize: 12.0,
                            fontFamily: AppDetails.fontPoppinsRegular,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Obx(() => Visibility(
                      visible: selectionController.selectedProfiles.value.length!=0,
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.040,
                        width: SizeConfig.screenWidth * 0.9,
                        child: ListView.builder(
                            shrinkWrap: false,
                            itemCount:
                            selectionController.selectedProfiles.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              RxList<String> profileList= selectionController.selectedProfiles;
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                      color:
                                      HexColor(CommonColors.appPrimaryColor),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      textWidget(
                                        textAlign: TextAlign.center,
                                        text: profileList.value[index],
                                        color: HexColor(CommonColors.whiteColor),
                                        fontSize: 12.0,
                                        fontFamily: AppDetails.fontPoppinsRegular,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      InkWell(
                                          onTap: (){
                                            profileList.remove(profileList[index]);
                                            // selectionController.selectedCities.value.remove(cityList[index]);
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 16,
                                            color: HexColor(CommonColors.whiteColor),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),),
                    textWidget(
                      text: "CITY",
                      color:
                          HexColor(CommonColors.greyTextColor).withOpacity(0.8),
                      fontSize: 12.0,
                      fontFamily: AppDetails.fontPoppinsRegular,
                      fontWeight: FontWeight.normal,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddCityPage()));
                        setState(() {});
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: HexColor(CommonColors.appPrimaryColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          textWidget(
                            text: "Add city",
                            color: HexColor(CommonColors.appPrimaryColor),
                            fontSize: 12.0,
                            fontFamily: AppDetails.fontPoppinsRegular,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Obx(() => Visibility(
                      visible: selectionController.selectedCities.value.length!=0,
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.040,
                        width: SizeConfig.screenWidth * 0.9,
                        child: ListView.builder(
                            shrinkWrap: false,
                            itemCount:
                            selectionController.selectedCities.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              RxList<String> cityList= selectionController.selectedCities;
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                      color:
                                      HexColor(CommonColors.appPrimaryColor),
                                      borderRadius:
                                      const BorderRadius.all(Radius.circular(5))),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      textWidget(
                                        textAlign: TextAlign.center,
                                        text: cityList.value[index],
                                        color: HexColor(CommonColors.whiteColor),
                                        fontSize: 12.0,
                                        fontFamily: AppDetails.fontPoppinsRegular,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      InkWell(
                                          onTap: (){
                                            cityList.remove(cityList[index]);
                                            // selectionController.selectedCities.value.remove(cityList[index]);
                                          },
                                          child: Icon(
                                            Icons.close,
                                            size: 16,
                                            color: HexColor(CommonColors.whiteColor),
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),),
                    textWidget(
                      text: "MAXIMUM DURATION(IN MONTHS)",
                      color:
                          HexColor(CommonColors.greyTextColor).withOpacity(0.8),
                      fontSize: 12.0,
                      fontFamily: AppDetails.fontPoppinsRegular,
                      fontWeight: FontWeight.normal,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Obx(() => DropdownButtonFormField<String>(
                      validator: (value) {},
                      decoration: InputDecoration(
                        labelText: "Choose Duration".tr,
                        errorStyle: textFormFieldErrorStyle(),
                        labelStyle: textFormFieldLabelStyle(),
                        counterText: "",
                        hintStyle: textFormFieldHintStyle(),
                        filled: true,
                        fillColor: HexColor(CommonColors.whiteColor),
                        border: commonBorder(),
                        errorBorder: commonErrorBorder(),
                        enabledBorder: commonTextBorderAfterText(),
                        focusedBorder: commonFocusBorder(),
                        focusedErrorBorder: commonErrorBorder(),
                      ),
                      dropdownColor: HexColor(CommonColors.whiteColor),
                      icon: const Icon(Icons.arrow_drop_down),
                      value: selectionController.selectedDuration.value,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectionController.selectedDuration.value = newValue!;
                        });
                      },
                      items: duration.values
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: textWidget(
                            text: value,
                            fontWeight: FontWeight.normal,
                            fontFamily: AppDetails.fontPoppinsRegular,
                            fontSize: 14.0,
                            color: HexColor(CommonColors.onBoardingTitleColor),
                          ),
                        );
                      }).toList(),
                    )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
