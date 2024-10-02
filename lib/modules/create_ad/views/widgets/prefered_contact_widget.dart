import 'package:bulka/core/utils/enums/enums.dart';
import 'package:flutter/material.dart';

class PreferedContactWidget extends StatefulWidget {
  const PreferedContactWidget({
    super.key,
    this.onSelected,
  });
  final Function(PreferedContact? choosenPreferedContact)? onSelected;

  @override
  State<PreferedContactWidget> createState() => _PreferedContactWidgetState();
}

class _PreferedContactWidgetState extends State<PreferedContactWidget> {
  PreferedContact? _selectedPreferedContact;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        PreferedContact.values.length,
        (index) {
          return RadioListTile<PreferedContact>(
            title: Text(PreferedContact.values[index].name),
            value: PreferedContact.values[index],
            groupValue: _selectedPreferedContact,
            onChanged: (value) {
              setState(() {
                _selectedPreferedContact = value;
              });
              widget.onSelected?.call(_selectedPreferedContact);
            },
          );
        },
      ),
    );
  }
}
