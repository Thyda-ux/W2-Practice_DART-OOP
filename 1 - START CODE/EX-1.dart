enum Skill { FLUTTER, DART, OTHER }

class Address {
    final String street;
    final String city;
    final String zipCode;

    Address(this.city,this.street,this.zipCode);

    @override
    String toString() {
      return '$street, $city, $zipCode';
    }
}

class Employee {
  final String name;
  final double baseSalary;
  final List<Skill> skills;
  final Address address;
  final int yearsOfExprience;

//Constructor
  Employee(this.name, this.baseSalary, this.skills, this.address, this.yearsOfExprience);

//Named constructor
  Employee.mobileDeveloper({required String name, required double baseSalary, required Address address, required int yearsOfExprience}) 
      : this(name, baseSalary, [Skill.FLUTTER, Skill.DART], address, yearsOfExprience);

// Getter methods
  String get getName => name;
  double get getBaseSalary => baseSalary;
  List<Skill> get getSkills => skills;
  Address get getAddress => address;
  int get getYearsOfExprience => yearsOfExprience;

// Salary calculation method
double calculateSalary() {
  double salary = baseSalary + (yearsOfExprience * 2000);

  for ( var skill in skills) {
  switch (skill){
    case Skill.FLUTTER: 
      salary += 5000;
      break;
    case Skill.DART:
      salary += 3000;
      break;
    case Skill.OTHER:
      salary += 1000;
      break;
    }
  }
  return salary;
}
  void printDetails() {
    print('Employee: $name');
    print('Base Salary: \$${baseSalary}');
    print('Skills: ${skills.map((s) => s.name).join(', ')}');
    print('Address: $address');
    print('Years of Experience: $yearsOfExprience');
    print('---');
  }
}
void main() {
   var emp1 = Employee(
    'Sokea',
    40000,
    [Skill.FLUTTER, Skill.OTHER],
    Address('Street 1', 'Phnom Penh', '12000'),
    5,
  );

  var emp2 = Employee.mobileDeveloper(
    name: 'Ronan',
    baseSalary: 45000,
    address: Address('Street 2', 'Siem Reap', '13000'),
    yearsOfExprience: 3,
  );
   emp1.printDetails();
  emp2.printDetails();

}