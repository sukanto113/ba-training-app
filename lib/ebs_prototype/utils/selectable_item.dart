import 'package:get/get.dart';

class SelectableItem<T extends Enum> {
  SelectableItem({
    required this.displayName,
    required this.group,
    required this.onSelect,
    required this.type,
  }) {
    group.items.add(this);
    group.itemToTypeMap[this] = type;
    group.typeToItemMap[type] = this;
  }
  final String displayName;
  final SelectableItemGroup<T> group;
  final T type;
  final Function() onSelect;

  void select() {
    onSelect();
  }

  @override
  String toString() {
    return displayName;
  }
}

abstract class SelectableItemGroup<T extends Enum> {
  final List<SelectableItem> items = [];
  final Map<T, SelectableItem<T>> typeToItemMap = {};
  final Map<SelectableItem<T>, T> itemToTypeMap = {};
}
