import 'package:equatable/equatable.dart';

abstract class DropDownModel<T> {
  DropDownItem getDropDownItem();

  T getDomainModelFromDropDownItem(DropDownItem dropDownItem);
}
class DropDownItem extends Equatable {
  int? id;
  late String name;

  DropDownItem({this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
enum DropDownType {
  category,
  supplier,
  brand,
  unit,
  payment;
}