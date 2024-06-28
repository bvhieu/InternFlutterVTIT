// main() async {
//   countSeconds(4);
//   createOrderMessage();
// }

// Example of asynchronous
void createOrderMessage() async {
  print('Awaiting user order...');
  var order = await getUserOrder();
  print('Your order is: $order');
}

Future<String> getUserOrder() {
  // Imagine that this function is more complex and slow.
  return Future.delayed(Duration(seconds: 4), () => 'Large Latte');
}

void countSeconds(s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}

// Example of asynchronous