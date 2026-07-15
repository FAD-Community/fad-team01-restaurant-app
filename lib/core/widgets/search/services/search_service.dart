import 'package:ka3da/core/widgets/search/models/searchable.dart';

class SearchService<T extends Searchable> {
  List<T> search({required List<T> items, required String query}) {
    if (query.trim().isEmpty) {
      return items;
    }

    final q = query.toLowerCase().trim();

    return items.where((item) {
      return item.title.toLowerCase().contains(q) ||
          item.subtitle.toLowerCase().contains(q);
    }).toList();
  }
}
