import 'package:choppersample/providers/countryProvider.dart';
import 'package:choppersample/ui/screens/countryList/uiWidgets/countryListItem.dart';
import 'package:choppersample/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountryListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DataProvider dataProvider =
        Provider.of<DataProvider>(context, listen: false);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: countryList.length,
      itemBuilder: (_, index) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
          child: CountryListItem(index,
              onSelected: (int pSelectedIndex) =>
                  dataProvider.country = countryList[pSelectedIndex]),
        ),
      ),
    );
  }
}
