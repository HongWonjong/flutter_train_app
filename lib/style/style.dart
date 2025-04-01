import 'package:flutter/material.dart';

// 공통적으로 사용할 스타일들, 텍스트 스타일, 컬러, 데코레이션, 패딩 등등이 있다.
const kStationLabelStyle = TextStyle(
  fontSize: 16,
  color: Colors.grey,
  fontWeight: FontWeight.bold,
);

const kStationNameStyle = TextStyle(
  fontSize: 40,
  color: Colors.black,
);

const kButtonTextStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kSelectedStationStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.purple,
  fontSize: 30,
);

const kSeatLabelStyle = TextStyle(
  fontSize: 16,
);

const kStationListItemStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
);

const kDisabledTextStyle = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);

const kCancelButtonStyle = TextStyle(
  color: Colors.red,
);

const kConfirmButtonStyle = TextStyle(
  color: Colors.blue,
);

// Colors
const kPrimaryColor = Colors.purple;
const kDividerColor = Colors.grey;
final kUnselectedColor = Colors.grey[200];
final kDividerLightColor = Colors.grey[300];
final kDividerMediumColor = Colors.grey[400];

// Decorations
const kStationContainerDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(20)),
);

const kButtonShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(20)),
);

BoxDecoration kSeatDecoration(bool isSelected) => BoxDecoration(
  color: isSelected ? kPrimaryColor : kUnselectedColor,
  borderRadius: BorderRadius.circular(8),
);

const kLegendSelectedDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

final kLegendUnselectedDecoration = BoxDecoration(
  color: kUnselectedColor,
  borderRadius: BorderRadius.all(Radius.circular(8)),
);

// Other constants
const kDefaultPadding = EdgeInsets.all(20);
const kVerticalPadding10 = EdgeInsets.symmetric(vertical: 10);
const kVerticalPadding20 = EdgeInsets.symmetric(vertical: 20);
const kHorizontalPadding20 = EdgeInsets.symmetric(horizontal: 20);
const kCustomPadding = EdgeInsets.only(bottom: 8);
const kLeftPadding20 = EdgeInsets.only(left: 20);
const kRightPadding20 = EdgeInsets.only(right: 20);
const kSymmetricPadding20_10 = EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const kSeatSize = Size(40, 40);
const kIconSize = 30.0;