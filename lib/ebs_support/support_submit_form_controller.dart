import 'package:get/get.dart';

import 'models/support_submit_form_model.dart';


class SupportSubmitFormController extends GetxController {
  SupportFormModel model = SupportFormModel();

  SupportSubmitFormController(){
    ever(model.supportType, (type) {
      onSupportTypeChange();
    });
  }

  void onSupportTypeChange(){
    print("support type is changed: ${model.supportType}");
    // adjust..visibility
  }

}
