import 'package:final_project1/core/app_theme.dart';
import 'package:flutter/material.dart';


import 'item_expantsion.dart';
import 'my_expansion_panal.dart';

class MyExpansionWidget extends StatefulWidget {
  const MyExpansionWidget({
    Key? key,
    required this.items,
    this.onTapItem,


  }) : super(key: key);

  final List<ItemExpansion> items;
  final Function(int)? onTapItem;

  @override
  State<MyExpansionWidget> createState() => _MyExpansionWidgetState();
}

class _MyExpansionWidgetState extends State<MyExpansionWidget> {
  @override
  Widget build(BuildContext context) {
    final listItem = widget.items.map(
      (e) {
        return MyExpansionPanel(



          canTapOnHeader: true,
          isExpanded: e.isExpanded,
          headerBuilder: (_, isExpanded) => e.header,
          body: e.body,
          enable: e.enable,
          onTapItem: widget.onTapItem,
        );
      },
    ).toList();

    return MyExpansionPanelList(

      elevation: 0.0,
      children: listItem,
      dividerColor: Colors.transparent,


      expansionCallback: (panelIndex, isExpanded) {
        setState(() {

          widget.items[panelIndex].isExpanded =
              !widget.items[panelIndex].isExpanded;
        });
      },
    );
  }
}
