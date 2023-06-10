import 'package:ba_training_app/ebs_prototype/features/support/domain/support_list_model.dart';

class SupportRepository {
  static Future<List<SupportItem>> getAllSupport() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      SupportItem(
        type: SupportType.supportTicket,
        title: "A Support Ticket",
        description: "this is a support ticket",
        assignTo: "Sukanto Saha",
      ),
      SupportItem(
        type: SupportType.task,
        title: "A Task",
        description: "this is a support ticket",
      ),
      SupportItem(
        type: SupportType.todo,
        title: "A Todo",
        description: "this is a support ticket",
      ),
    ];
  }
}
