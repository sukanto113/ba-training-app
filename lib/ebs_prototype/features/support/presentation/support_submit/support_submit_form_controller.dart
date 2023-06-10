import 'package:ba_training_app/ebs_prototype/features/support/domain/support_list_model.dart';
import 'package:get/get.dart';

import 'support_submit_form_state.dart';

class SupportSubmitFormController extends GetxController {
  SupportFormState state = SupportFormState();
  SupportItem? existingItem;

  SupportSubmitFormController({this.existingItem}) {
    SupportItem? item = existingItem;
    if (item != null) {
      state.fromSupportItem(item);
    }

    ever(state.supportType, (type) {
      onSupportTypeChange();
    });
  }

  void onSupportTypeChange() {
    print("support type is changed: ${state.supportType}");
    // adjust..visibility
  }
}
