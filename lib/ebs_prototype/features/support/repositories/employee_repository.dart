import 'package:ba_training_app/ebs_prototype/features/support/domain/employee.dart';

class EmplyeeRepository {
  static Future<Iterable<Employee>> getAllEmployee() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      Employee(name: "Sukanto Saha"),
      Employee(name: "Hussain Kabir Badhon"),
      Employee(name: "Nowshin Chowdhury"),
      Employee(name: "Shafiqul Islam"),
      Employee(name: "Jahid Hasan"),
    ];
  }
}
