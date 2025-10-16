enum DeliveryType { delivery, pickup }

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

class Customer {
  final String name;
  final String address;

  Customer(this.name, this.address);
}

class Order {
  final Customer customer;
  final List<Product> products;
  final DeliveryType deliveryType;

  Order({
    required this.customer,
    required this.products,
    required this.deliveryType,
  });

  double getTotalAmount() {
    return products.fold(0, (sum, item) => sum + item.price);
  }
}

void main() {
  // Sample data
  var product1 = Product("T-Shirt", 15.0);
  var product2 = Product("Cap", 8.0);
  var customer = Customer("Dara", "Phnom Penh");

  var order = Order(
    customer: customer,
    products: [product1, product2],
    deliveryType: DeliveryType.delivery,
  );

  print("Customer: ${order.customer.name}");
  print("Delivery Type: ${order.deliveryType}");
  print("Total Amount: \$${order.getTotalAmount()}");
}
