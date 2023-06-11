import 'package:ba_training_app/ebs_prototype/features/support/application/support_edit_service.dart';
import 'package:ba_training_app/ebs_prototype/features/support/domain/support.dart';
import 'package:get/get.dart';

import 'support_submit_form_state.dart';

class SupportSubmitFormController extends GetxController {
  SupportFormState state = SupportFormState();
  final SupportEditApplication _app;

  late final String submitButtonText;

  SupportSubmitFormController({SupportItem? existingItem})
      : _app = SupportEditApplication(existingItem) {
    _setupSubmitButtonText(existingItem);
    _syncWithApp();
    _listenSupportTypeChange();
  }

  void _listenSupportTypeChange() {
    ever(state.supportType, (type) {
      _setSupportType();
    });
  }

  void _syncWithApp() {
    state.syncWithSupportItem(_app.supportItem);
  }

  void _setSupportType() {
    _app.setType(state.supportTypeGroup.itemToTypeMap[state.supportType]);
    _syncWithApp();
  }

  void _setupSubmitButtonText(SupportItem? existingItem) {
    if (existingItem == null) {
      submitButtonText = "Save";
    } else {
      submitButtonText = "Update";
    }
  }
}
