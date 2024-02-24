from django.shortcuts import redirect, render
from django.contrib import messages
from django.contrib.auth.models import User
from django.http.response import JsonResponse
from django.http import HttpResponse

from django.contrib.auth.decorators import login_required
from store.models import Cart,Order,OrderItem,Product,Profile
import random
from store.views import productview

@login_required(login_url='loginpage')
def index(request):
    rawcart= Cart.objects.filter(user=request.user)
    for item in rawcart:
        if item.product_qty > item.product.quantity:
            Cart.objects.delete(id=item.id)
            
    cartitems= Cart.objects.filter(user=request.user)
    total_price=0
    for item in cartitems:
        total_price = total_price + item.product.selling_price * item.product_qty
    
    userprofile = Profile.objects.filter(user=request.user).first()
    
    context={'cartitems':cartitems,'total_price':total_price,'userprofile':userprofile}        
    return render(request,"store/checkout.html",context)


@login_required(login_url='loginpage')
def placeorder(request):
    if request.method == "POST" :
        
        currentuser= User.objects.filter(id=request.user.id).first()
        if not currentuser.first_name:
            currentuser.first_name = request.POST.get('fname')
            currentuser.last_name = request.POST.get('lname')
            currentuser.save()
        if not Profile.objects.filter(user=request.user):
            userprofile=Profile()
            userprofile.user = request.user
            userprofile.fname=request.POST.get('fname')
            userprofile.lname=request.POST.get('lname')
            userprofile.email=request.POST.get('email')
            userprofile.phone=request.POST.get('phone')
            userprofile.city=request.POST.get('city')
            userprofile.district=request.POST.get('district')
            userprofile.specific_address=request.POST.get('specific_address')
            userprofile.save()
        
        neworder=Order()
        neworder.user = request.user
        neworder.fname=request.POST.get('fname')
        neworder.lname=request.POST.get('lname')
        neworder.email=request.POST.get('email')
        neworder.phone=request.POST.get('phone')
        neworder.city=request.POST.get('city')
        neworder.district=request.POST.get('district')
        neworder.specific_address=request.POST.get('specific_address')
        
        neworder.payment_mode= request.POST.get('payment_mode')
        cart=Cart.objects.filter(user=request.user)
        cart_total_price=0
        for item in cart:
            cart_total_price = cart_total_price + item.product.selling_price * item.product_qty
            
        neworder.total_price= cart_total_price
        trackno= "ID"+str(random.randint(111111,999999))
        while Order.objects.filter(tracking_no=trackno) is None:
            trackno = "ID"+str(random.randint(111111,999999))
            
        neworder.tracking_no=trackno
        neworder.save()
        
        neworderitems= Cart.objects.filter(user=request.user)
        for item in neworderitems:
            OrderItem.objects.create(
                order=neworder,
                product=item.product,
                price=item.product.selling_price,
                quantity=item.product_qty
            )
            orderproduct = Product.objects.filter(id=item.product_id).first()
            orderproduct.quantity=orderproduct.quantity - item.product_qty
            orderproduct.save()

        Cart.objects.filter(user=request.user).delete()\
            
        payMode= request.POST.get('payment_mode')
        if(payMode == "Paid by Paypal"):
            return JsonResponse({'status':"Your order has been placed successfully"})
        else:
            messages.success(request,"Your order has been placed successfully")
    return redirect("/")
    
    
def orders(request):
    return  HttpResponse("my order page")
    