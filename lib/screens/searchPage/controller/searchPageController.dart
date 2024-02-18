import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internshala_submission/screens/filtersPage/controller/selectionController.dart';
import 'package:internshala_submission/screens/searchPage/model/internshipModel.dart';
import 'dart:convert' as convert;
import '../../../apiManager/APIManager.dart';
SelectionController selectionController =
Get.put(SelectionController(),);
class SearchPageController extends GetxController{
  RxList<InternshipModel> internshipModelList= <InternshipModel>[].obs;
  RxList<String> profileList=<String>[].obs;
  RxList<String> cityList=<String>[].obs;
  Future getResponse({required BuildContext context}) async {
    http.Response response = await APIManager.fetchAPIResponse();
    debugPrint(
        '1-1-1-1-1 API Response Status Code ${response.statusCode}');
    debugPrint(
        '1-1-1-1-1 API Response Body ${response.body}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      var data = convert.jsonDecode(response.body);
      final jsonData= convert.jsonDecode(response.body);
      print('internships meta ${jsonData['internships_meta']}');
      jsonData['internships_meta'].forEach((key, value) {
        var item = InternshipModel.fromJson(value);
        internshipModelList.add(item);
        if(!profileList.contains(item.title))
          {
            profileList.add(item.title);
          }
        for(var city in item.locationNames){
          if(!cityList.contains(city))
            {
              cityList.add(city);
            }
        }
      });
      log(' internship model list ${internshipModelList}');
      debugPrint('list of profiles $profileList');
      debugPrint('list of cities $cityList');
      debugPrint(
          "1-1-1-1-1 API Response 200 :: ${response.toString()}");

      return 1;
      // }
    } else if (response.statusCode == 403) {
      // UnAuthorized
      // showToaster(msg: 'auAuthorized_user'.tr);
      return 0;
      // APImanager.unAuthorizedUser(context);
    } else if (response.statusCode == 500) {

      return 0;
    } else if (response.statusCode == 404) {

      return 0;
    } else if (response.statusCode == 400) {
      var data = convert.jsonDecode(response.body);

      // debugPrint("Error ::::: ${data["errors"]["phone"].toString()}");
      return 0;
    } else {

      return 0;
    }
  }
  RxList<String> allFilters=<String>[].obs;
  RxList<InternshipModel> filteredResult=<InternshipModel>[].obs;

  filterProfile()
  {
    if(selectionController.selectedProfiles.isEmpty)
      {
        log('filtered results after filtering profile $filteredResult');
        return;

      }
    for(InternshipModel model in internshipModelList)
      {
        if(!selectionController.selectedProfiles.value.contains(model.title))
          {
            filteredResult.value.remove(model);
            debugPrint('filter profile run');
          }
      }
    log('filtered results after filtering profile $filteredResult');
  }

  filterCities()
  {
    if(selectionController.selectedCities.isEmpty)
      {
        log('filtered results after filtering cities $filteredResult');
        return;
      }
    List<InternshipModel> deleteList= [];
    for(InternshipModel model in filteredResult.value)
    {
      int flag=0;
      for(String city in model.locationNames)
        {
          debugPrint('city found or not ${selectionController.selectedCities.value.contains(city)}');
          if(selectionController.selectedCities.value.contains(city))
          {
            flag=1;
            break;
          }
        }
      if(flag==0)
        deleteList.add(model);
    }
    for(InternshipModel model in deleteList)
      {
        filteredResult.value.remove(model);
      }
    log('filtered results after filtering cities $filteredResult');
  }

  filterDuration()
  {
    debugPrint('selectedDuration ${selectionController.selectedDuration.value}');
    if(selectionController.selectedDuration.value==duration[Duration.choose])
    {
      return;
    }
    List<InternshipModel> deleteList= [];
    for(InternshipModel model in filteredResult.value)
    {
      RegExp regex = RegExp(r'\d+');
      debugPrint('current duration ${model.duration}');
      Match? match = regex.firstMatch(model.duration);
      String? numberString = match?.group(0);

      int duration=0;
      if (numberString != null) {
        duration = int.parse(numberString);

      }
      int selectedDuration=int.parse(selectionController.selectedDuration.value);
      debugPrint('converted duration $duration');
      debugPrint('selected duration $selectedDuration');
      if(duration.runtimeType== selectedDuration.runtimeType)
        {
          debugPrint('same data type');
        }
        // debugPrint('duration found or not ${selectionController.selectedCities.value.contains(city)}');
        if(duration>selectedDuration)
        {
          deleteList.add(model);
        }
    }
    for(InternshipModel model in deleteList)
    {
      filteredResult.value.remove(model);
    }
    log('filtered results after filtering duration $filteredResult');
  }
  totalFilter()
  {
    filteredResult.value.clear();
    filteredResult.value.addAll(internshipModelList.value);
    log('filtered results before functions $filteredResult');
    filterProfile();
    filterCities();
    filterDuration();
    log('filtered results after functions $filteredResult');
  }
}