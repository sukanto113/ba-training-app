import 'package:get/get.dart';

import '../utils/selectable_item.dart';

class SupportTypeModel {
  late final rxValue = Rxn<SelectableItem>();

  late final supportTicket = SelectableItem(
    displayName: "Support Ticket",
    rxValue: rxValue,
  );
  late final task = SelectableItem(
    displayName: "Task",
    rxValue: rxValue,
  );
  late final todo = SelectableItem(
    displayName: "Todo",
    rxValue: rxValue,
  );

  late final List<SelectableItem> items = [
    supportTicket,
    task,
    todo,
  ];
}

class SupportFormModel {
  final SupportTypeModel _supportTypeModel = SupportTypeModel();

  late final supportType = _supportTypeModel.rxValue;
  late final supportTypeOptions = _supportTypeModel.items;

  fromMap() {
    supportType.value = _supportTypeModel.todo;
  }
}
