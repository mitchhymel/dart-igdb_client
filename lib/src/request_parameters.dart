
class IGDBRequestParameters {
  final String filters; // https://api-docs.igdb.com/#filters
  final List<int> ids;
  final List<String> fields;
  final int limit;
  final String order; // https://api-docs.igdb.com/#sorting
  final String search;
  final int offset; // https://api-docs.igdb.com/#pagination

  const IGDBRequestParameters({
    this.filters,
    this.ids,
    this.fields,
    this.limit,
    this.order,
    this.search,
    this.offset,
  });

  IGDBRequestParameters copyWith({
    String filters,
    List<String> ids,
    List<String> fields,
    int limit,
    String order,
    String search,
    int offset
  }) {
    return new IGDBRequestParameters(
      filters: filters ?? this.filters,
      ids: ids ?? this.ids,
      fields: fields ?? this.fields,
      limit: limit ?? this.limit,
      order: order ?? this.order,
      search: search ?? this.search,
      offset: offset ?? this.offset,
    );
  }

  String toBody() {
    String result = '';

    if (search != null && search != '') {
      result += 'search "$search";';
    }

    if (fields != null && fields.length > 0) {
      result += 'fields ${fields.join(',')};';
    }
    else {
      result += 'fields *;';
    }

    if (ids != null && ids.length > 0) {
      result += 'where id = (${ids.join(',')});';
    }

    if (filters != null && filters.length > 0) {
      result += 'where $filters;';
    }

    if (order != null && order != '') {
      result += 'sort $order;';
    }

    if (limit != null && limit > 0) {
      result += 'limit $limit;';
    }

    if (offset != null && offset > 0) {
      result += 'offset $offset;';
    }

    return result;
  }

}