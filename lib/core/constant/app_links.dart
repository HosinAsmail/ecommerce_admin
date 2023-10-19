class AppLinks {
  AppLinks._();
  static const String serverLink =
      'https://housinasmail.000webhostapp.com/ecommerce';

  static const String serverAdminLink = '$serverLink/admin';
  // ================================= Auth ================================= //
  static const String authLink = '$serverAdminLink/auth';
  static const String loginLink = '$authLink/login.php';
  // ================================= Home ================================= //
  static const String homeLink = '$serverAdminLink/home.php';
  // ================================= User ================================= //
  static const String userLink = '$serverAdminLink/users/view.php';

  // ================================= Notification ================================= //
  static const String notificationLink = '$serverAdminLink/notification.php';

  // ================================= Images ================================= //
  static const String imageLink = '$serverAdminLink/upload';
  static const String imageCategoriesLink = '$imageLink/categories';
  static const String imageProductsLink = '$imageLink/products';
  // ================================= Products ================================= //
  static const String productLink = '$serverAdminLink/products';
  static const String getProductLink = '$productLink/get_product.php';
  static const String searchProductLink = '$productLink/search_product.php';
  static const String getOffersLink = '$productLink/offer.php';

  // ================================= Favorite ================================= //
  static const String favoriteLink = '$serverAdminLink/favorite';
  static const String addFavoriteLink = '$favoriteLink/add.php';
  static const String deleteFavoriteLink = '$favoriteLink/delete.php';
  static const String viewFavoriteLink = '$favoriteLink/view.php';

  // ================================= Cart ================================= //
  static const String cartLink = '$serverAdminLink/cart';
  static const String addCartLink = '$cartLink/add.php';
  static const String deleteCartLink = '$cartLink/delete.php';
  static const String viewCartLink = '$cartLink/view.php';

  // ================================= Address ================================= //
  static const String addressLink = '$serverAdminLink/address';
  static const String addAddressLink = '$addressLink/add.php';
  static const String deleteAddressLink = '$addressLink/delete.php';
  static const String viewAddressLink = '$addressLink/view.php';
  static const String editAddressLink = '$addressLink/edit.php';
  // ================================= Order ================================= //
  static const String orderAdminLink = '$serverAdminLink/order';
  static const String placeOrderLink = '$orderAdminLink/place_order.php';
  static const String pendingOrderLink = '$orderAdminLink/pending_order.php';
  static const String detailsOrderLink = '$orderAdminLink/order_details.php';
  static const String deleteOrderLink = '$orderAdminLink/delete_order.php';
  static const String orderLink = '$serverLink/order';
  static const String archiveOrderLink = '$orderLink/archive_order.php';
}
