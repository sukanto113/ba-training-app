import 'package:ba_training_app/ebs_prototype/features/support/domain/support_item.dart';
import 'package:ba_training_app/ebs_prototype/features/support/presentation/support_submit/support_submit_form_controller.dart';
import 'package:ba_training_app/ebs_prototype/utils/constants/text_constants.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_form_titile_label.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_search_dropdown.dart';
import 'package:ba_training_app/ebs_prototype/widgets/gaps.dart';
import 'package:ba_training_app/ebs_prototype/widgets/visibilityrx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_radio_button_group.dart';

class SupportSubmitFormPage extends StatelessWidget {
  const SupportSubmitFormPage({super.key, this.existingItem});
  final SupportItem? existingItem;

  @override
  Widget build(BuildContext context) {
    Get.put(SupportSubmitFormController(existingItem: existingItem));
    return const Scaffold(
      appBar: CustomAppBar(
        appBarTitle: SupportTextConstants.supportTicketTitle,
      ),
      body: SupportSubmitForm(),
    );
  }
}

class SupportSubmitForm extends StatefulWidget {
  const SupportSubmitForm({
    super.key,
  });

  @override
  State<SupportSubmitForm> createState() => _SupportSubmitFormState();
}

class _SupportSubmitFormState extends State<SupportSubmitForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final SupportSubmitFormController controller = Get.find();
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const ShortVerticalGap(),
          const MandatoryFormLabel(label: SupportTextConstants.type),
          CustomRadioButtonGroup(
            options: controller.state.supportTypeOptions,
            existingRadioSelected: controller.state.supportType.value,
          ),
          VisibilityRx(
            visible: controller.state.isAssignToVisible,
            child: CustomSearchDropDown(
              selectedItem: "Sukanto Saha",
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                if (value == null) {
                  return '';
                }
                return null;
              },
              onSelected: (String value) {},
              title: 'Assign To',
              searchBox: true,
              items: [],
            ),
          ),
        ],
      ),
    );
  }
}
