import 'dart:convert';

class LocationModel {
  final String string;
  final String link;
  final String country;
  final String region;
  final String locationName;

  LocationModel({
    required this.string, required this.link, required this.country, required this.region, required this.locationName
});

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      string: json["string"],
      link: json["link"],
      country: json["country"],
      region: json["region"]??'',
      locationName: json["locationName"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "string": this.string,
      "link": this.link,
      "country": this.country,
      "region": this.region,
      "locationName": this.locationName,
    };
  }

  @override
  String toString() {
    return 'LocationModel{string: $string, link: $link, country: $country, region: $region, locationName: $locationName}';
  }

//
}

class InternshipModel {
  final int id;
  final String title;
  final String employment_type;
  final String companyName;
  final String startDate;
  final String duration;
  final String stipend;
  final String postedByLabel;
  final String postedByLabelType;
  final List<String> locationNames;
  final List<LocationModel> locations;

  InternshipModel({
    required this.id,
    required this.title,
    required this.employment_type,
    required this.companyName,
    required this.startDate,
    required this.duration,
    required this.stipend,
    required this.postedByLabel,
    required this.postedByLabelType,
    required this.locationNames,
    required this.locations,
  });


  factory InternshipModel.fromJson(Map<String, dynamic> json) {
    return InternshipModel(
      id: json['id'],
      title: json['title'],
      employment_type: json['employment_type']??'',
      companyName: json['company_name'],
      startDate: json['start_date'],
      duration: json['duration'],
      stipend: json['stipend']['salary'],
      postedByLabel: json['posted_by_label'],
      postedByLabelType: json['posted_by_label_type'],
      locationNames: List<String>.from(json['location_names']),
      locations: (json['locations'] as List<dynamic>)
          .map((locationJson) => LocationModel.fromJson(locationJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "title": this.title,
      "employment_type": this.employment_type,
      "companyName": this.companyName,
      "startDate": this.startDate,
      "duration": this.duration,
      "stipend": this.stipend,
      "postedByLabel": this.postedByLabel,
      "postedByLabelType": this.postedByLabelType,
      "locationNames": jsonEncode(this.locationNames),
      "locations": jsonEncode(this.locations),
    };
  }

  @override
  String toString() {
    return 'Internship{id: $id, title: $title, employment_type: $employment_type, companyName: $companyName, startDate: $startDate, duration: $duration, stipend: $stipend, postedByLabel: $postedByLabel, postedByLabelType: $postedByLabelType, locationNames: $locationNames, locations: $locations}';
  }
}
