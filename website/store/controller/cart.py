from django.shortcuts import redirect,render
from store.models import Product, Cart
from django.http.response import JsonResponse
from django.contrib.auth.decorators import login_required


def addtocart(request):
    if request.method == 'POST':
        if request.user.is_authenticated:
            prod_id = int(request.POST.get('product_id'))
            product_qty = int(request.POST.get('product_qty'))
            
            cart_item = Cart.objects.filter(user=request.user, product_id=prod_id).first()
            if cart_item:
                cart_item.product_qty += product_qty
                cart_item.save()
                return JsonResponse({'status': "Updated quantity successfully"})
            else:

                Cart.objects.create(user=request.user, product_id=prod_id, product_qty=product_qty)
                return JsonResponse({'status': "Added to cart"})
        else:
            return JsonResponse({'status': "Login is required"})
    
    return JsonResponse({'status': "Invalid request"})

@login_required(login_url="loginpage")
def viewcart(request):
    cart = Cart.objects.filter(user = request.user)
    context = { 'cart':cart}
    return render(request,"store/cart.html", context)

def updatecart(request):
    if request.method == "POST":
        prod_id = int(request.POST.get('product_id'))
        if (Cart.objects.filter(user=request.user,product_id=prod_id)):
            prod_qty = int(request.POST.get('product_qty'))
            cart = Cart.objects.get(product_id=prod_id,user=request.user)
            cart.product_qty = prod_qty
            cart.save()
            return JsonResponse({'status':"Update successful"})
    return redirect('/')

def deletecartitem(request):
    if request.method == "POST":
        prod_id = int(request.POST.get('product_id'))
        if Cart.objects.filter(user=request.user, product_id=prod_id):
            cartitem = Cart.objects.get(product_id=prod_id, user=request.user)
            cartitem.delete()
            return JsonResponse({'status': "Deleted successfully"})
    return redirect('/')

    
            