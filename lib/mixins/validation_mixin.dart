mixin ValidationMixin {
  bool isValidPrice(double price) {
    return price >= 0;
  }

  bool isValidQuantity(int quantity) {
    return quantity >= 0;
  }
}