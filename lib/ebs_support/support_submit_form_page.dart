import 'package:ba_training_app/ebs_support/support_submit_form_controller.dart';
import 'package:ba_training_app/ebs_support/utils/constants/text_constants.dart';
import 'package:ba_training_app/ebs_support/utils/selectable_item.dart';
import 'package:ba_training_app/ebs_support/widgets/custom_form_titile_label.dart';
import 'package:ba_training_app/ebs_support/widgets/gaps.dart';
import 'package:flutter/material.dart';

import 'models/support_submit_form_model.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_radio_button_group.dart';

class SupportSubmitFormPage extends StatelessWidget {
  const SupportSubmitFormPage({super.key});

  @override
  Widget build(BuildContext context) {
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
  final controller = SupportSubmitFormController();

  @override
  Widget build(BuildContext context) {
    controller.model.fromMap();
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const ShortVerticalGap(),
          const MandatoryFormLabel(label: SupportTextConstants.type),
          CustomRadioButtonGroup(
            options: controller.model.supportTypeOptions,
            existingRadioSelected: controller.model.supportType.value,
          ),
        ],
      ),
    );
  }
}
