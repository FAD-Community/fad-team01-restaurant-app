import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ka3da/core/widgets/search/cubit/search_state.dart';
import 'package:ka3da/core/widgets/search/models/searchable.dart';
import 'package:ka3da/core/widgets/search/services/search_service.dart';

class SearchCubit<T extends Searchable> extends Cubit<SearchState<T>> {
  SearchCubit() : super(SearchState<T>());
  final SearchService<T> _searchService = SearchService<T>();

  List<T> _source = [];

  List<T> get items => _source;
  void setItems(List<T> items) {
    print("SET ITEMS");

    _source = items;

    emit(state.copyWith(results: items, suggestions: []));
  }

  void filter(List<T> items) {
    print("FILTER");
    _source = items;

    if (state.query.isEmpty) {
      emit(state.copyWith(results: items));
    } else {
      search(state.query);
    }
  }

  void submitSearch() {
    emit(state.copyWith(suggestions: []));
  }

  void search(String query) {
    final result = _searchService.search(items: _source, query: query);

    final suggestions = query.trim().isEmpty ? <T>[] : result.take(6).toList();

    print("Suggestions Before Emit = ${suggestions.length}");

    emit(
      state.copyWith(query: query, results: result, suggestions: suggestions),
    );

    print("SEARCH EMIT");
  }

  void clear() {
    emit(state.copyWith(query: "", results: _source, suggestions: []));
  }

  void addRecent(String query) {
    final text = query.trim();

    if (text.isEmpty) return;

    final list = List<String>.from(state.recent);

    list.remove(text);

    list.insert(0, text);

    if (list.length > 8) {
      list.removeLast();
    }

    emit(state.copyWith(recent: list));
  }

  void removeRecent(String query) {
    final list = List<String>.from(state.recent);

    list.remove(query);

    emit(state.copyWith(recent: list));
  }

  void clearRecent() {
    emit(state.copyWith(recent: []));
  }

  void selectSuggestion(T item) {
    addRecent(item.title);
    emit(
      state.copyWith(
        query: item.title,
        results: [item, ...state.results.where((e) => e != item)],
        suggestions: [],
      ),
    );
  }

  List<Object> getSuggestions(String query) {
    if (query.trim().isEmpty) {
      return state.recent;
    }

    return _searchService.search(items: _source, query: query);
  }
}
