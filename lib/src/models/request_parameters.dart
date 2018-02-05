import 'filter.dart';

class IGDBRequestParameters {
  final List<Filter> filters;
  final List<String> ids;
  final List<String> fields;
  final String expand;
  final int limit;
  final String order;
  final String search;
  final int scroll;
  final int offset;

  const IGDBRequestParameters({
    this.filters,
    this.ids,
    this.fields,
    this.expand,
    this.limit,
    this.order,
    this.search,
    this.scroll,
    this.offset,
  });

}