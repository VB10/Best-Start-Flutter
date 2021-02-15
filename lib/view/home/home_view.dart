import 'package:flutter/material.dart';

import '../../compenets/card/categories_card.dart';
import '../../core/base/base_state.dart';
import '../../core/extension/context_extension.dart';
import '../../cosnstant/color_constant.dart';
import 'home_model.dart';
import 'home_view_model.dart';

part 'home_string_values.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with BaseState {
  HomeModel model;
  final _HomeStringValues values = _HomeStringValues();

  final HomeViewModel viewModel = HomeViewModel();
  int value = 0;
  @override
  void initState() {
    super.initState();
    model = HomeModel('vb', 'vb2');
    getSharedValues();
  }

  Future<void> getSharedValues() async {
    value = await viewModel.getValueOnPrefences();
    setState(() {});
  }

  void _changeValue() {
    value = viewModel.randomValue();
    viewModel.setValueOnPrefences(value);
    setState(() {});
  }

  Color get _primary => value % 2 == 0 ? Colors.red : Colors.black;
  Color get _secondary => value % 2 == 0 ? Colors.green : Colors.yellow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      appBar: AppBar(),
      body: Column(
        children: [
          buildText(context),
          Expanded(child: buildCategoriesCard()),
          Expanded(flex: 2, child: buildListView(context)),
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _changeValue,
      child: Text('$value'),
    );
  }

  Text buildText(BuildContext context) =>
      Text(values.title, style: Theme.of(context).textTheme.headline1.copyWith(color: ColorConstants.instance.appleBlossom));

  CategoriesCard buildCategoriesCard() => CategoriesCard(body: model.title, name: model.description);

  ListView buildListView(BuildContext context) {
    return ListView(
      children: [
        AnimatedContainer(duration: durationCosntants.durationLow, height: context.dynamicHeight(0.1), color: _primary),
        AnimatedContainer(duration: durationCosntants.durationLow, height: context.dynamicHeight(0.01), color: _primary),
        AnimatedContainer(duration: durationCosntants.durationLow, height: context.dynamicHeight(0.1), color: _secondary),
        AnimatedContainer(duration: durationCosntants.durationLow, height: context.dynamicHeight(0.12), color: _primary),
      ],
    );
  }
}
