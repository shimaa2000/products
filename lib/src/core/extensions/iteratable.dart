extension IterableModifier<E> on Iterable<E> {
  E? firstWhereOrNull(bool Function(E) test) =>
      cast<E?>().firstWhere((v) => v != null && test(v), orElse: () => null);

  List<E> getFirst(int count) {
    if (length <= count) {
      return toList();
    } else {
      return toList().sublist(count);
    }
  }
}
