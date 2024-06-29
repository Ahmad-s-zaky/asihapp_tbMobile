
enum AppRoute{
  homeScreen,
  stockScreen,
  productScreen,
  sellerScreen,
}

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(
    initialLocation
  )
})