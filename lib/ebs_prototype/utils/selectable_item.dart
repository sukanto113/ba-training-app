import 'package:get/get.dart';

class SelectableItem {
  SelectableItem({
    required this.displayName,
    required this.rxValue,
  });
  final String displayName;
  Rxn<SelectableItem> rxValue;
  void onSelect() {
    rxValue.value = this;
  }

  @override
  String toString() {
    return displayName;
  }
}

abstract class SelectableItemGroup {
  late final rxValue = Rxn<SelectableItem>();
  List<SelectableItem> get items;
}
