import 'package:ba_training_app/ebs_prototype/features/support/domain/support.dart';
import 'package:get/get.dart';

import '../../../../utils/selectable_item.dart';

class SupportTypeGroup extends SelectableItemGroup<SupportType> {
  late final SelectableItem<SupportType> supportTicket;
  late final SelectableItem<SupportType> task;
  late final SelectableItem<SupportType> todo;
  late final rxValue = Rxn<SelectableItem<SupportType>>();

  SupportTypeGroup() {
    supportTicket = SelectableItem(
      displayName: "Support Ticket",
      group: this,
      onSelect: () {
        rxValue.value = supportTicket;
      },
      type: SupportType.supportTicket,
    );

    task = SelectableItem(
      displayName: "Task",
      group: this,
      onSelect: () {
        rxValue.value = task;
      },
      type: SupportType.task,
    );

    todo = SelectableItem(
      displayName: "Todo",
      group: this,
      onSelect: () {
        rxValue.value = todo;
      },
      type: SupportType.todo,
    );
  }
}

class SupportFormState {
  final SupportTypeGroup supportTypeGroup = SupportTypeGroup();

  late final supportType = supportTypeGroup.rxValue;
  late final supportTypeOptions = supportTypeGroup.items;
  final isAssignToVisible = false.obs;
  final Rx<Future<List<String>>> assignToList =
      Rx<Future<List<String>>>(Future.value([]));
  final assignTo = "".obs;
  final Rxn<String> title = Rxn();
  final Rxn<String> description = Rxn();

  void syncWithSupportItem(SupportItem item) {
    supportType.value = supportTypeGroup.typeToItemMap[item.type];
    isAssignToVisible.value = item.type == SupportType.supportTicket;
    assignTo.value = item.assignTo?.name ?? "";
    title.value = item.title;
    description.value = item.description;
  }
}
