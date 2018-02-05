
class FilterOperator {

  static const FilterOperator EQUAL = const FilterOperator._private('eq');
  static const FilterOperator NOT_EQUAL = const FilterOperator._private('not_eq');
  static const FilterOperator GREATER_THAN = const FilterOperator._private('gt');
  static const FilterOperator GREATER_THAN_OR_EQUAL = const FilterOperator._private('gte');
  static const FilterOperator LESS_THAN = const FilterOperator._private('lt');
  static const FilterOperator LESS_THAN_OR_EQUAL = const FilterOperator._private('lte');
  static const FilterOperator PREFIX = const FilterOperator._private('prefix');
  static const FilterOperator EXISTS = const FilterOperator._private('exists');
  static const FilterOperator NOT_EXISTS = const FilterOperator._private('not_exists');
  static const FilterOperator IN = const FilterOperator._private('in');
  static const FilterOperator NOT_IN = const FilterOperator._private('not_in');
  static const FilterOperator ANY = const FilterOperator._private('any');

  final String value;
  const FilterOperator._private(this.value);
}

class Filter {
  final String property;
  final FilterOperator operator;
  final Object value;

  Filter(this.property, this.operator, this.value);

  String toString() {
    return '[$property][${operator.value}]=$value';
  }
}