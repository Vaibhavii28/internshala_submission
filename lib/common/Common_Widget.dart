import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../AppDetails.dart';
import '../screens/comingSoon/view/comingSoonPage.dart';
import '../screens/searchPage/model/internshipModel.dart';
import 'Common_Colors.dart';
import 'SizeConfig.dart';

class textWidget extends StatelessWidget {
  String text;
  FontWeight? fontWeight;
  double? fontSize;
  Color? color;
  String? fontFamily;
  int? maxLines;
  TextOverflow? overflow;
  FontStyle? fontStyle;
  TextAlign? textAlign;
  TextDecoration? decoration;

  textWidget({
    required this.text,
    this.fontWeight = FontWeight.normal,
    this.fontSize,
    this.maxLines,
    this.color,
    this.fontFamily,
    this.overflow,
    this.fontStyle,
    this.textAlign,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: TextStyle(
        fontStyle: fontStyle,
        fontWeight: fontWeight,
        fontSize: fontSize,
        decoration: decoration,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: 0.5,
        overflow: overflow,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}

Widget filterByTypeWidget({
  required String titleType,
}) {
  return Container(
    color:  HexColor(CommonColors.greyFourColor),
    child: SizedBox(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 80,
            width: 3,
            color:  HexColor(CommonColors.greyFourColor),
          ),
          const SizedBox(
            width: 10,
          ),
          textWidget(
            text: titleType.toString(),
            fontWeight: FontWeight.bold,
            fontFamily: AppDetails.fontPoppinsBold,
            color: HexColor(CommonColors.grayThreeColor),
          )
        ],
      ),
    ),
  );
}

class CommonButton extends StatelessWidget {
  void Function()? onPressed;
  String buttonText;
  double fontSize;
  double height;
  double width;
  String buttonColor;
  String fontColor;
  String buttonFontFamily;
  double borderRadius;
  FontWeight? fontWeight;
  BorderSide? borderSide;

  CommonButton({
    required this.onPressed,
    required this.buttonText,
    this.height = 55.0,
    this.fontSize = 14.0,
    this.width = 254,
    this.buttonColor = "#CC3539",
    this.buttonFontFamily = "Poppins-Regular",
    this.fontWeight,
    this.fontColor = "#fffff",
    this.borderSide,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: (borderSide != null)
                ? borderSide!
                : BorderSide(color: HexColor(buttonColor), width: 0),
          ),
          side: (borderSide != null)
              ? borderSide!
              : BorderSide(color: HexColor(buttonColor), width: 0),
          elevation: 0.0,
          backgroundColor: HexColor(buttonColor),
        ),
        onPressed: onPressed,
        child: textWidget(
          text: buttonText.tr,
          color: HexColor(fontColor),
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: buttonFontFamily,
        ),
      ),
    );
  }
}

Widget labelText({required String labelText, double fontSize = 12.0}) {
  return textWidget(
    text: labelText.toString(),
    fontFamily: AppDetails.fontPoppinsRegular,
    fontWeight: FontWeight.normal,
    fontSize: fontSize,
    color: HexColor(CommonColors.grayThreeColor),
  );
}

Widget labelValue({required String labelValue,double fontSize=12}) {
  return textWidget(
    text: labelValue.toString(),
    maxLines: 3,
    overflow: TextOverflow.ellipsis,
    fontFamily: AppDetails.fontPoppinsRegular,
    fontWeight: FontWeight.normal,
    fontSize: fontSize,
    color: HexColor(CommonColors.greyTextColor),
  );
}

Widget showInternshipDetailCardDesign({
  String? viewDetails = "View Details",required BuildContext context,
  required InternshipModel internshipModel
}) {
  return Column(
    children: [
      Container(
        margin: const EdgeInsets.only(top: 5.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: HexColor(CommonColors.blackColor).withOpacity(0.12),
                blurRadius: 8),
          ],
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12.0),
            topLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            bottomLeft: Radius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Container(
                    width: SizeConfig.screenWidth*0.85,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12.0),
                            topLeft: Radius.circular(12.0), bottomLeft: Radius.circular(12.0), bottomRight: Radius.circular(12.0),)),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: SizeConfig.screenWidth*0.8,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Wrap(
                                children: <Widget>[
                                  SizedBox(
                                    width: SizeConfig.screenWidth*0.4,
                                    child: textWidget(
                                      text: internshipModel.title??'',
                                      fontWeight: FontWeight.bold,
                                      fontFamily: AppDetails.fontPoppinsSemiBold,
                                      color: HexColor(CommonColors.blackColor),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        textWidget(
                          text: internshipModel.companyName,
                          fontFamily: AppDetails.fontPoppinsRegular,
                          color: HexColor(CommonColors.greyTextColor),
                          fontWeight: FontWeight.normal,
                          fontSize: 12.0,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Icon(Icons.home)
                            ),
                            const SizedBox(
                              width: 9.0,
                            ),
                            textWidget(
                              text: internshipModel.locationNames.isEmpty? 'Work from home' :internshipModel.locationNames.join(', '),
                              fontFamily: AppDetails.fontPoppinsRegular,
                              color: HexColor(CommonColors.greyTextColor),
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Icon(Icons.play_circle_outline)
                                ),
                                const SizedBox(
                                  width: 9.0,
                                ),
                                textWidget(
                                  text: internshipModel.startDate,
                                  fontFamily: AppDetails.fontPoppinsRegular,
                                  color: HexColor(CommonColors.greyTextColor),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 9.0,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                    height: 24.0,
                                    width: 24.0,
                                    child: Icon(Icons.calendar_month)
                                ),
                                const SizedBox(
                                  width: 9.0,
                                ),
                                textWidget(
                                  text: internshipModel.duration,
                                  fontFamily: AppDetails.fontPoppinsRegular,
                                  color: HexColor(CommonColors.greyTextColor),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Icon(Icons.money_sharp)
                            ),
                            const SizedBox(
                              width: 9.0,
                            ),
                            textWidget(
                              text: internshipModel.stipend,
                              fontFamily: AppDetails.fontPoppinsRegular,
                              color: HexColor(CommonColors.greyTextColor),
                              fontWeight: FontWeight.normal,
                              fontSize: 12.0,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                            color: HexColor(CommonColors.tagBackColor),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: textWidget(
                            text: internshipModel.employment_type,
                            color: HexColor(CommonColors.greyTextColor),
                            fontSize: 12.0,
                            fontFamily: AppDetails.fontPoppinsRegular,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
                          decoration: BoxDecoration(
                            color: internshipModel.postedByLabelType=='success'? HexColor(CommonColors.greenColor).withOpacity(0.16): HexColor(CommonColors.greyTextColor)
                                .withOpacity(0.16),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: SizedBox(
                            width: internshipModel.postedByLabel=='Today'?SizeConfig.screenWidth*0.15:SizeConfig.screenWidth*0.2,
                            child: Row(
                              children: [
                                 Icon(Icons.access_time_rounded, size: 15, color: internshipModel.postedByLabelType=='success'? HexColor(CommonColors.greenColor): HexColor(CommonColors.greyTextColor),),
                                textWidget(
                                  text: internshipModel.postedByLabel,
                                  color: internshipModel.postedByLabelType=='success'? HexColor(CommonColors.greenColor): HexColor(CommonColors.greyTextColor),
                                  fontSize: 12.0,
                                  fontFamily: AppDetails.fontPoppinsRegular,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: 2.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                HexColor("#D9D9D9").withOpacity(0.25),
                                HexColor("#D9D9D9").withOpacity(0.100),
                                HexColor("#D9D9D9").withOpacity(0.25),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Expanded(
                              child: InkWell(
                                onTap:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ComingSoonPage()));
                                },
                                child: Column(
                                  children: <Widget>[
                                    textWidget(
                                      text: viewDetails?? '',
                                      fontSize: 14.0,
                                      color: HexColor(CommonColors.appPrimaryColor),
                                      fontWeight: FontWeight.normal,
                                      fontFamily: AppDetails.fontPoppinsRegular,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Container(
                          height: 2.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                HexColor("#D9D9D9").withOpacity(0.16),
                                HexColor("#D9D9D9").withOpacity(0.100),
                                HexColor("#D9D9D9").withOpacity(0.16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
      
    ],
  );
}



textFormFieldErrorStyle() => TextStyle(
    fontFamily: AppDetails.fontPoppinsRegular,
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: HexColor(CommonColors.errorColor));

textFormFieldTextStyle() => TextStyle(
  fontFamily: AppDetails.fontPoppinsRegular,
  fontSize: 16.0,
  fontWeight: FontWeight.normal,
  color: HexColor(CommonColors.textFormFieldTextColor),
);

commonEnableBorder({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.textFormFieldEnableColor),
    width: 1,
  ),
);

textFormFieldLabelStyle() => TextStyle(
    color: HexColor(CommonColors.textFormFieldLabelColor),
    fontFamily: AppDetails.fontPoppinsRegular,
    fontSize: 16.0,
    fontWeight: FontWeight.normal);

textFormFieldHintStyle() => TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 16.0,
  fontFamily: AppDetails.fontPoppinsRegular,
  color: HexColor(CommonColors.textFormFieldHintColor),
);

commonBorder({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.textFormFieldActiveBorderColor),
    width: 1,
  ),
);

commonErrorBorder({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.textFormFieldErrorColor),
    width: 2,
  ),
);

commonTextBorderAfterText(
    {String color = CommonColors.textFormFieldDisableColor}) =>
    OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.0),
      borderSide: BorderSide(
        color: HexColor(color),
        width: 1,
      ),
    );

commonFocusBorder({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.appPrimaryColor),
    width: 2,
  ),
);

textFormFieldDateTextStyle() => TextStyle(
  fontFamily: AppDetails.fontPoppinsRegular,
  fontSize: 10.0,
  fontWeight: FontWeight.normal,
  color: HexColor(CommonColors.textFormFieldTextColor),
);

textFormFieldDateLabelStyle() => TextStyle(
    color: HexColor(CommonColors.textFormFieldLabelColor),
    fontFamily: AppDetails.fontPoppinsRegular,
    fontSize: 11.0,
    fontWeight: FontWeight.normal);

textFormFieldDateHintStyle() => TextStyle(
  fontWeight: FontWeight.normal,
  fontSize: 8.0,
  fontFamily: AppDetails.fontPoppinsRegular,
  color: HexColor(CommonColors.textFormFieldHintColor),
);

commonEnableBorderDate({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.appPrimaryColor),
    width: 1,
  ),
);

commonBorderDate({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.appPrimaryColor),
    width: 1,
  ),
);

commonFocusBorderDate({double borderRadius = 4.0}) => OutlineInputBorder(
  borderRadius: BorderRadius.circular(borderRadius),
  borderSide: BorderSide(
    color: HexColor(CommonColors.appPrimaryColor),
    width: 2,
  ),
);
