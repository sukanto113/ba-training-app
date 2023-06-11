import 'package:ba_training_app/ebs_prototype/features/support/domain/employee.dart';

enum SupportType {
  supportTicket,
  task,
  todo,
}

class SupportItem {
  SupportItem({
    this.type,
    this.assignTo,
    this.title,
    this.description,
  });

  final SupportType? type;
  final Employee? assignTo;
  final String? title;
  final String? description;

  SupportItem copyWith({
    SupportType? type,
    Employee? assignTo,
    String? title,
    String? description,
  }) {
    return SupportItem(
      type: type ?? this.type,
      assignTo: assignTo ?? this.assignTo,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return '{type: $type, assignTo: $assignTo, title: $title, description: $description}';
  }
}

extension MutableSupportItem on SupportItem {
  SupportItem setType(SupportType? type) {
    return copyWith(type: type);
  }

  SupportItem setAssignTo(Employee emplyee) {
    return copyWith(assignTo: emplyee);
  }

  SupportItem setTitle(String title) {
    return copyWith(title: title);
  }

  SupportItem setDescription(String description) {
    return copyWith(description: description);
  }
}
