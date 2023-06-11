import 'package:ba_training_app/ebs_prototype/features/support/domain/support_list_model.dart';
import 'package:get/get.dart';

import 'support_submit_form_state.dart';

class SupportSubmitFormController extends GetxController {
  SupportFormState state = SupportFormState();
  late SupportItem supportItem;

  SupportSubmitFormController({SupportItem? existingItem}) {
    // SupportItem item = supportItem ?? ;
    supportItem = existingItem ?? SupportItem();
    state.syncWithSupportItem(supportItem);

    ever(state.supportType, (type) {
      onSupportTypeChange();
    });
  }

  void onSupportTypeChange() {
    if (state.supportType.value != null) {
      final item = supportItem
          .setType(state.supportTypeGroup.itemToTypeMap[state.supportType]!);
      state.syncWithSupportItem(item);
    }
  }
}
