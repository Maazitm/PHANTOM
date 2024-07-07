import 'dart:io';

void main() {
  int sum;
  print("Enter your first number:");
  int num1 = int.parse(stdin.readLineSync()!);

  stdout.write("Enter secound number:");
  int num2 = int.parse(stdin.readLineSync()!);

  stdout.write("enter thired number:");
  int num3 = int.parse(stdin.readLineSync()!);
  sum = num1 + num2;

  print("The result is $sum");
}
