import 'package:flutter/material.dart';
import 'package:news/model/SourceResponse.dart';

class SourceNameItem extends StatelessWidget {
  Source source; //object   to acsess name later
  bool isSelected;

  SourceNameItem({required this.source, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Text(
      source.name ?? '', //accessed name from object
      style: isSelected
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.labelMedium,
    );
  }
}
