class Repository<T> {
  final List<T> _items = [];

  void add(T item) => _items.add(item);
  List<T> get all => List.unmodifiable(_items);
}