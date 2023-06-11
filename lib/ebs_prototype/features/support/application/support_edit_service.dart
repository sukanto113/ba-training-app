import 'package:ba_training_app/ebs_prototype/features/support/domain/employee.dart';
import 'package:ba_training_app/ebs_prototype/features/support/domain/support.dart';

class SupportEditApplication {
  late SupportItem supportItem;

  SupportEditApplication(SupportItem? existingItem) {
    supportItem = existingItem ?? SupportItem();
  }

  void setType(SupportType? type) {
    supportItem = supportItem.setType(type);
  }

  void setAssignTo(String name) {
    supportItem = supportItem.setAssignTo(Employee(name: name));
  }

  void setTitle(String title){
    supportItem = supportItem.setTitle(title);
  }

  void setDescription(String description){
    supportItem = supportItem.copyWith(description: description);
  }
}
