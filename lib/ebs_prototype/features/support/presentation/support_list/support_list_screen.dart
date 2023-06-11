import 'package:ba_training_app/ebs_prototype/features/support/domain/support_item.dart';
import 'package:ba_training_app/ebs_prototype/features/support/presentation/support_list/support_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SupportListPage extends StatelessWidget {
  const SupportListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SupportListController());

    return Scaffold(
      body: Obx(() {
        final Iterable<SupportItem> items = c.state;
        final bool isLoading = c.isLoading.value;
        final bool isError = c.isError.value;
        if (isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (isError) {
          return const Center(
            child: Text("Error!"),
          );
        }
        return SupportListWidget(items: items);
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => c.addNewSupportPress(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SupportListWidget extends StatelessWidget {
  const SupportListWidget({
    super.key,
    required this.items,
  });

  final Iterable<SupportItem> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return SupportListItemWidget(item: items.elementAt(index));
      },
    );
  }
}

class SupportListItemWidget extends StatelessWidget {
  const SupportListItemWidget({
    super.key,
    required this.item,
  });

  final SupportItem item;

  @override
  Widget build(BuildContext context) {
    final c = Get.find<SupportListController>();

    return ListTile(
      title: Text(item.title ?? ""),
      trailing: IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () => c.editSupport(item),
      ),
    );
  }
}
