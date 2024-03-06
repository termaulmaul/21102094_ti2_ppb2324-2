void main() async {
  print('Getting your product...');
  try {
    var order = await getProduct();
    print('You order: $order');
  } catch (error) {
    print('Sorry. $error');
  } finally {
    print('Thank you');
  }
}

Future<String> getProduct() {
  return Future.delayed(Duration(seconds: 3), () {
    var isProductAvailable = false;
    if (isProductAvailable) {
      return 'Matcha Latte';
    } else {
      throw 'Our stock is not enough.';
    }
  });
}
