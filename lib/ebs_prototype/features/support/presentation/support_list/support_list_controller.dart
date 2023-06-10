import 'package:ba_training_app/ebs_prototype/features/support/domain/support_list_model.dart';
import 'package:ba_training_app/ebs_prototype/features/support/repositories/support_repository.dart';
import 'package:ba_training_app/ebs_prototype/features/support/presentation/support_submit/support_submit_form_screen.dart';
import 'package:get/get.dart';

class SupportListController extends GetxController {
  final state = <SupportItem>[].obs;
  final isLoading = false.obs;
  final isError = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loadSupportItemFromRepo();
  }

  void editSupport(SupportItem item) {
    Get.to(() => SupportSubmitFormPage(existingItem: item));
  }

  void loadSupportItemFromRepo() async {
    isLoading.value = true;
    try {
      isError.value = false;
      state.value = await SupportRepository.getAllSupport();
    } catch (e) {
      isError.value = true;
    }
    isLoading.value = false;
  }

  addNewSupportPress() {
    Get.to(() => const SupportSubmitFormPage());
  }
}
