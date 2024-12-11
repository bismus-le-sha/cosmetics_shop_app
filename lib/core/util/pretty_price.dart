class PrettyPrice {
  static String formatPrice(int price) {
    String priceString = price.toString();
    StringBuffer formattedPrice = StringBuffer();

    int length = priceString.length;
    int count = 0;

    for (int i = length - 1; i >= 0; i--) {
      formattedPrice.write(priceString[i]);
      count++;

      if (count % 3 == 0 && i != 0) {
        formattedPrice.write(' ');
      }
    }

    return formattedPrice.toString().split('').reversed.join();
  }
}
