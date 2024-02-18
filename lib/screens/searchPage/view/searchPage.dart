import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:internshala_submission/common/Common_Widget.dart';
import 'package:internshala_submission/screens/comingSoon/view/comingSoonPage.dart';
import 'package:internshala_submission/screens/filtersPage/view/filterScreen.dart';

import '../../../AppDetails.dart';
import '../../../common/Common_Colors.dart';
import '../../../common/SizeConfig.dart';
import '../../filtersPage/controller/selectionController.dart';
import '../controller/searchPageController.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  SearchPageController searchPageController = Get.put(
    SearchPageController(),
  );
  SelectionController selectionController = Get.put(
    SelectionController(),
  );
  @override
  void initState() {
    searchPageController.getResponse(context: context);
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(preferredSize: const Size.fromHeight(55),
          child: SizedBox(height: 55,
            child: Container(
              height: 55,
              width: SizeConfig.screenWidth,
              decoration: BoxDecoration(
                color: HexColor(CommonColors.dashboardBackColor),
                boxShadow: [
                  BoxShadow(
                      color: HexColor("#D0D0D0"),
                      blurRadius: 5),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 8.0, bottom: 0.0),
                visualDensity:
                const VisualDensity(horizontal: -4.0, vertical: -4),
                leading: InkWell(onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ComingSoonPage()));
                }, child: Icon(Icons.menu)),
                trailing: SizedBox(
                  width: SizeConfig.screenWidth * 0.30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ComingSoonPage()));
                        },
                        child: Icon(
                          Icons.search_outlined,
                          color: HexColor(CommonColors.greyTextColor),
                        ),
                      ),
                    ],
                  ),
                ),
                title: textWidget(
                  text:
                  "Internships",
                  fontSize: 16.0,
                  fontFamily: AppDetails.fontPoppinsRegular,
                  color: HexColor(CommonColors.onBoardingTitleColor),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: HexColor(CommonColors.dashboardBackColor),
        body: Obx(() => Column(

          children: [
            Container(height: SizeConfig.screenHeight * 0.1,
              width: SizeConfig.screenWidth,
              color: HexColor(CommonColors.whiteColor),
              child: searchPageController.allFilters.length==0?Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),

                  InkWell(
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FilterPage()));},
                    child: Container(
                      height: SizeConfig.screenHeight*0.04,
                      width: SizeConfig.screenWidth*0.25,
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: HexColor(CommonColors.appPrimaryColor)),
                        color: HexColor(CommonColors.whiteColor),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.filter_alt_outlined,color: HexColor(CommonColors.appPrimaryColor),),
                            textWidget(
                              text: "Filters",
                              color: HexColor(CommonColors.appPrimaryColor),
                              fontSize: 15.0,
                              fontFamily: AppDetails.fontPoppinsRegular,
                              fontWeight: FontWeight.bold,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textWidget(
                    text: "${searchPageController.internshipModelList.length} total internships",
                    color: HexColor(CommonColors.greyTextColor).withOpacity(0.8),
                    fontSize: 12.0,
                    fontFamily: AppDetails.fontPoppinsRegular,
                    fontWeight: FontWeight.normal,
                  ),

                ],
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 8.0,
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> FilterPage()));},
                          child: Container(
                            height: SizeConfig.screenHeight*0.04,
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                            decoration: BoxDecoration(
                              border: Border.all(color: HexColor(CommonColors.appPrimaryColor)),
                              color: HexColor(CommonColors.whiteColor),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  textWidget(
                                    text: "Filters",
                                    color: HexColor(CommonColors.appPrimaryColor),
                                    fontSize: 15.0,
                                    fontFamily: AppDetails.fontPoppinsRegular,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  Container(
                                    width: SizeConfig.screenWidth*0.05, // Adjust the width and height as needed
                                    height: SizeConfig.screenWidth*0.05,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.blue, // Change the color as needed
                                    ),
                                    child: Center(
                                      child: textWidget(
                                        text: "${searchPageController.allFilters.length}",
                                        color: HexColor(CommonColors.whiteColor),
                                        fontSize: 12.0,
                                        fontFamily: AppDetails.fontPoppinsRegular,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )

                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: SizeConfig.screenWidth*0.70,
                        height: SizeConfig.screenHeight*0.04,
                        child: ListView.builder(
                            shrinkWrap: false,
                            itemCount:
                            searchPageController.allFilters.value.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              RxList<String> filterList=searchPageController.allFilters;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Container(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                              decoration: BoxDecoration(
                                  border: Border.all(color: HexColor(CommonColors.greyTextColor).withOpacity(0.6)),
                                  color:
                                  HexColor(CommonColors.whiteColor),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textWidget(
                                    textAlign: TextAlign.center,
                                    text: filterList.value[index],
                                    color: HexColor(CommonColors.greyTextColor),
                                    fontSize: 12.0,
                                    fontFamily: AppDetails.fontPoppinsRegular,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  InkWell(
                                      onTap: (){

                                        if(selectionController.selectedCities.contains(filterList[index]))
                                          {
                                            selectionController.selectedCities.value.remove(filterList[index]);
                                          }
                                       else if(selectionController.selectedProfiles.contains(filterList[index]))
                                        {
                                          selectionController.selectedProfiles.value.remove(filterList[index]);
                                        }
                                       else
                                         {
                                           selectionController.selectedDuration.value=duration[Duration.choose]!;
                                         }
                                        filterList.remove(filterList[index]);
                                       searchPageController.totalFilter();
                                      },
                                      child: Icon(
                                        Icons.close,
                                        size: 16,
                                        color: HexColor(CommonColors.greyTextColor),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  textWidget(
                    text: searchPageController.filteredResult.value.length>0?"${searchPageController.filteredResult.value.length} internships matching filters":
                    "No internship found",
                    color: HexColor(CommonColors.greyTextColor).withOpacity(0.8),
                    fontSize: 12.0,
                    fontFamily: AppDetails.fontPoppinsRegular,
                    fontWeight: FontWeight.normal,
                  ),

                ],
              )

            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.70,
              child: ListView.builder(itemCount: searchPageController.allFilters.length==0?searchPageController.internshipModelList.length: searchPageController.filteredResult.length, itemBuilder: (context,index){
                debugPrint('locations list ${searchPageController.internshipModelList[index].locationNames}');
                return Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: showInternshipDetailCardDesign(context: context, internshipModel: searchPageController.allFilters.length==0? searchPageController.internshipModelList[index]: searchPageController.filteredResult.value[index]),
                );
              }),
            ),
          ],
        ),)
      ),
    );
  }
}
