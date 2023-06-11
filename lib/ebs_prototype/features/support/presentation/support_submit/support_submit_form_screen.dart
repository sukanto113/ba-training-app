import 'package:ba_training_app/ebs_prototype/features/support/domain/support.dart';
import 'package:ba_training_app/ebs_prototype/features/support/presentation/support_submit/support_submit_form_controller.dart';
import 'package:ba_training_app/ebs_prototype/utils/constants/text_constants.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_button.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_form_titile_label.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_search_dropdown.dart';
import 'package:ba_training_app/ebs_prototype/widgets/custom_text_ield.dart';
import 'package:ba_training_app/ebs_prototype/widgets/gaps.dart';
import 'package:ba_training_app/ebs_prototype/widgets/visibilityrx.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
  final titleEditingController = TextEditingController();
  final descriptoinEditingController = TextEditingController();

  @override
  void dispose() {
    titleEditingController.dispose();
    descriptoinEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Build called");
    final SupportSubmitFormController controller = Get.find();
    titleEditingController.text = controller.state.title.value ?? "";
    descriptoinEditingController.text =
        controller.state.description.value ?? "";
    final String assignTo = controller.state.assignTo.value;

    titleEditingController.addListener(() {
      controller.setTitle(titleEditingController.text);
    });

    descriptoinEditingController.addListener(() {
      controller.setDescription(descriptoinEditingController.text);
    });

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
          const ShortVerticalGap(),
          CustomTextField(
            onChangedFunction: (val) {},
            controller: titleEditingController,
            textInputType: TextInputType.text,
            readOnly: false,
            maxValue: 1,
            title: 'Title',
            isRequired: false,
          ),
          const ShortVerticalGap(),
          VisibilityRx(
            visible: controller.state.isAssignToVisible,
            child: Column(
              children: [
                Obx(
                  () {
                    final futureAssignToList =
                        controller.state.assignToList.value;
                    return DropdownSearch<String>(
                      selectedItem: assignTo,
                      validator: (value) {
                        if (value == null) {
                          return '';
                        }
                        return null;
                      },
                      onChanged: (String? value) {
                        if (value != null) {
                          controller.setAssignTo(value);
                        }
                      },
                      asyncItems: (t) async {
                        return await futureAssignToList;
                      },
                    );
                  },
                ),
                const ShortVerticalGap(),
              ],
            ),
          ),
          CustomTextField(
            onChangedFunction: (val) {},
            controller: descriptoinEditingController,
            textInputType: TextInputType.text,
            readOnly: false,
            maxValue: 1,
            title: 'Description',
            isRequired: false,
          ),
          const ShortVerticalGap(),
          CustomButton(
            onPressed: () async {
              controller.submit();
            },
            buttonName: "save",
            icons: Icons.folder_open,
            buttonColor: Colors.indigo,
            child: Text(
              controller.submitButtonText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
