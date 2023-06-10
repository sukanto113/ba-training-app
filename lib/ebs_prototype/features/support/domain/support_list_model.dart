enum SupportType {
  supportTicket,
  task,
  todo,
}

class SupportItem {
  SupportItem({
    required this.type,
    this.assignTo,
    required this.title,
    required this.description,
  });

  final SupportType type;
  final String? assignTo;
  final String title;
  final String description;
}
