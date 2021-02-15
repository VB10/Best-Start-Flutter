import 'package:flutter/material.dart';

import '../../cosnstant/border_constant.dart';
import '../../cosnstant/color_constant.dart';
import '../../cosnstant/padding_constant.dart';

class CategoriesCard extends StatelessWidget {
  final String name;
  final String body;

  const CategoriesCard({Key key, @required this.name, @required this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue,
      margin: PaddingConstants.instance.paddingAllNormal,
      shape: BorderConstats.instance.radiusAllCirculor,
      child: buildAlignPaddingTexts(context),
    );
  }

  Align buildAlignPaddingTexts(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: PaddingConstants.instance.paddingAllNormal,
        child: buildColumnTexts(context),
      ),
    );
  }

  Column buildColumnTexts(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextName(context),
        buildTextBody(context),
      ],
    );
  }

  Text buildTextName(BuildContext context) =>
      Text(name, style: Theme.of(context).textTheme.headline3.copyWith(color: ColorConstants.instance.white, fontWeight: FontWeight.bold));

  Text buildTextBody(BuildContext context) => Text(body, style: Theme.of(context).textTheme.headline5.copyWith(color: ColorConstants.instance.white));
}
