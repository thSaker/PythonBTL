from django.urls import path,include
from . import views

from store.controller import authview,cart,wishlist,checkout,order

urlpatterns = [
    path('',views.home,name="home"),
    path('collections',views.collections,name="collections"),
    path('collections/<str:slug>',views.collectionsview,name="collectionsview"),
    path('collections/<str:cate_slug>/<str:prod_slug>',views.productview,name="productview"),
    path('product-list',views.productlistAjax),
    path('searchproduct',views.searchproduct,name="searchproduct"),
    path('register/', authview.register, name='register'),
    path('login/',authview.loginpage,name='loginpage'),
    path('logout/',authview.logoutpage,name="logout"),
    path('add-to-cart', cart.addtocart, name="addtocart"),
    path('cart',cart.viewcart,name="cart"),
    path("update-cart",cart.updatecart,name="updatecart"),
    path("deleteCartItem",cart.deletecartitem,name="deletecartitem"),
    path('wishlist',wishlist.index, name="wishlist"),
    path('addToWishlist',wishlist.addtowishlist,name="addtowishlist"),
    path('delete-wishlist-item',wishlist.deletewishlistitem,name="deletewishlistitem"),
    path('checkout',checkout.index,name="checkout"),
    path('place-order',checkout.placeorder,name="placeorder"),
    path('my-orders',order.index,name="myorders"),
    path('view-order/<str:t_no>',order.vieworder,name="orderview"),
    path('aboutus', views.about_us, name='aboutus'),
    path('contact/', views.contact_us, name='contactus'),
    path('news/', views.news_list, name='news_list'),
    path('news/<int:pk>/', views.news_detail, name='news_detail'),
    path('admin_tools_stats/', include('admin_tools_stats.urls')),
]
