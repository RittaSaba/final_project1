import 'package:flutter/material.dart';

class ItemExpansion {
  ItemExpansion({
    required this.header,
    required this.body,
    this.isExpanded = false,
    this.enable = true,
  });

  final Widget header;
  final Widget body;
  bool isExpanded;
  bool enable;
}
