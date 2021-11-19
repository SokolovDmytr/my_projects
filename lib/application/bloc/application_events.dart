abstract class ApplicationEvents {}

class FetchMemesEvent extends ApplicationEvents {}

class SearchTemplatesEvent extends ApplicationEvents {
  final String searchText;

  SearchTemplatesEvent({
    required this.searchText,
  });
}
