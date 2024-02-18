import 'package:get/get.dart';

import '../../searchPage/controller/searchPageController.dart';
SearchPageController searchPageController =
Get.put(SearchPageController(),);
enum Duration{
  choose,one,two,three,four,six,twelve,twentyfour,thirtysix
}
Map<Duration, String> duration={
  Duration.choose:'Choose Duration',
  Duration.one:'1',
  Duration.two:'2',
  Duration.three:'3',
  Duration.four:'4',
  Duration.six:'6',
  Duration.twelve:'12',
  Duration.twentyfour:'24',
  Duration.thirtysix:'36',
};
class SelectionController extends GetxController{

  RxBool isSelectProfileActive = false.obs;
  RxBool isSelectCityActive= false.obs;
  RxList<String> listOfProfiles=searchPageController.profileList;
  RxList<String> listOfCities= searchPageController.cityList;
  RxList<String> selectedProfiles=<String>[].obs;
  RxList<String> selectedCities=<String>[].obs;
  RxString selectedDuration= duration[Duration.choose]!.obs;
}