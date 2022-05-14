import 'package:flutter_test/flutter_test.dart';
import 'package:master/300/generic_learn.dart';

void main() {
  setUp(() {});
  test('User Calculate Test', () {
    final users = [
      GenericUser('name', '2', 10),
      GenericUser('name', '2', 10),
      GenericUser('name', '2', 20),
    ];

    UserManagement admin = UserManagement(AdminUser('name', 'id', 15, 1));
    final result = admin.CalculateMoney(users);
    final names = admin.showNames<String>(users);

    expect(result, 55);
  });
}
