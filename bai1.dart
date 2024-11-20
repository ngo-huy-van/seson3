abstract class Employee {
  String id;
  String name;

  Employee(this.id, this.name);
  void printIfo() {
    print("name: $id, ID: $name");
  }
  double calculateSalary();
}
abstract class Workable {
  void doWork();
}
class OfficeWorker extends Employee implements Workable {
  final String department;
  OfficeWorker(String id, String name, this.department) : super(name, id);
  @override
  void doWork() {
    // TODO: implement doWork
    print("$name đang làm việc tại phòng ban $department");
  }
  @override
  void printIfo() {
    // TODO: implement printIfo
    super.printIfo();
    print("department: $department");
  }

  @override
  double calculateSalary() {
    return 4000;
  }
}
class TechWorker extends Employee implements Workable {
  final String field;
  TechWorker(String id, String name, this.field) : super(name,id);

  @override
  double calculateSalary() {
    // TODO: implement calculateSalary
    return 5000;
  }

  @override
  void doWork() {
    // TODO: implement doWork
    print("$name đang làm việc tại phòng ban $field");
  }
  void printInfo() {
    // TODO: implement printIfo
    super.printIfo();
    print("field: $field");
  }
}
class Company {
  List<Employee> employees = [];
  void addEmployee(Employee employee) {
    employees.add(employee);
  }
  void printAllEmployees() {
    for (var employee in employees) {
      employee.printIfo();
      print('Lương: ${employee.calculateSalary()}');
    }
  }
  double getTotalSalary() {
    double totalSalary = 0.0;
    for (var employee in employees) {
      totalSalary += employee.calculateSalary();
    }
    return totalSalary;
  }
}
void main() {
  var company = Company();
  var officeWorker = OfficeWorker('1', 'huy', 'IT');
  var techWorker = TechWorker('2', 'hung', 'ITT');

  company.addEmployee(officeWorker);
  company.addEmployee(techWorker);

  print('Tất cả nhân viên: ');
  company.printAllEmployees();

  print('Tổng lương công ty : ${company.getTotalSalary()}');
}