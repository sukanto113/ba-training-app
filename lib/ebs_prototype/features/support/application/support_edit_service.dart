import 'package:ba_training_app/ebs_prototype/features/support/domain/support.dart';

class SupportEditApplication {
  late SupportItem supportItem;

  SupportEditApplication(SupportItem? existingItem) {
    supportItem = existingItem ?? SupportItem();
  }

  void setType(SupportType? type) {
    supportItem = supportItem.setType(type);
  }
}
