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
  final String? assignTo;
  final String? title;
  final String? description;

  SupportItem copyWith({
    SupportType? type,
    String? assignTo,
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
}

extension MutableSupportItem on SupportItem {
  SupportItem setType(SupportType? type) {
    return copyWith(type: type);
  }
}
