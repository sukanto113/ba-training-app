import 'package:ba_training_app/ebs_prototype/features/support/domain/support_list_model.dart';

import '../../../../utils/selectable_item.dart';

class SupportTypeGroup extends SelectableItemGroup {
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

  @override
  List<SelectableItem> get items => [
        supportTicket,
        task,
        todo,
      ];

  late final Map<SupportType, SelectableItem> itemMap = {
    SupportType.supportTicket: supportTicket,
    SupportType.task: task,
    SupportType.todo: todo,
  };
}

class SupportFormState {
  final SupportTypeGroup _supportTypeGroup = SupportTypeGroup();

  late final supportType = _supportTypeGroup.rxValue;
  late final supportTypeOptions = _supportTypeGroup.items;

  fromMap() {
    supportType.value = _supportTypeGroup.todo;
  }

  void fromSupportItem(SupportItem existingItem) {
    supportType.value = _supportTypeGroup.itemMap[existingItem.type];
  }
}
