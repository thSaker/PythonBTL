from django.shortcuts import render,redirect,get_object_or_404
from . models import *
from django.contrib import messages
from django.http.response import JsonResponse
from django.core.mail import send_mail


# Create your views here.
def home(request):
    return render(request,"store/index.html")

def collections(request):
    category = Category.objects.filter(status=0)
    context = { 'category': category}
    return render(request, "store/collections.html", context)

def collectionsview(request,slug):
    if(Category.objects.filter(slug=slug,status= 0)):
        products = Product.objects.filter(category__slug=slug)
        category= Category.objects.filter(slug=slug).first()
        context= {'products':products,'category':category}
        return render(request,"store/products/index.html",context)
    else:
        messages.warning(request,"No product categories found")
        return redirect('collections')
    
def productview(request,cate_slug,prod_slug):
    if (Category.objects.filter(slug=cate_slug,status=0)):
        if(Product.objects.filter(slug=prod_slug,status=0)):
            products = Product.objects.filter(slug=prod_slug,status=0).first
            context = {'products':products}
        else:
            messages.error(request,"No product found")
            return redirect('collections') 
    else:
        messages.error(request,"No product categories found ")
        return redirect('collections') 
    return render(request,"store/products/view.html",context)  

def productlistAjax(request):
    products = Product.objects.filter(status = 0).values_list('name',flat=True)
    productsList = list(products)
    return JsonResponse(productsList,safe=False)

def searchproduct(request):
    if request.method == "POST":
        searchedterm = request.POST.get('productsearch')
        if searchedterm == "" :
            return redirect(request.META.get("HTTP_REFFERER"))
        else:
            product = Product.objects.filter(name__contains = searchedterm).first()
            
            if product:
                return redirect('collections/'+ product.category.slug+'/'+product.slug)
            else:
                messages.info(request,"No product matched your search")
                return redirect(request.META.get("HTTP_REFFERER"))
        
    return redirect(request.META.get("HTTP_REFFERER"))

def about_us(request):
    return render(request, 'store/aboutus.html')

def contact_us(request):
    if request.method =="POST":
        message_name = request.POST.get('message_name', '')
        message_email = request.POST.get('message_email','')
        message_phone = request.POST.get('message_phone','')
        message_subject = request.POST.get('message_subject','')
        message = request.POST.get('message', '')
        
        data = {
            'subject':message_subject,
            'name':message_name,
            'email':message_email,
            'phone':message_phone,
            'message':message,
        }
        message = '''
            New message: {}
            From: {}
            Phone: {}
        '''.format(data['message'],data['email'],data['phone'])
        send_mail(data['subject'],message,"",['phanduythanh26102002@gmail.com'],)
        
        return render(request, 'store/contact.html',{'message_name':message_name})
        
    else:
        return render(request, 'store/contact.html')

def news_list(request):
    news = News.objects.all()
    return render(request, 'store/news/news_list.html', {'news': news})

def news_detail(request, pk):
    news = get_object_or_404(News, pk=pk)
    
    recent_posts = News.objects.exclude(pk=pk).order_by('-date_posted')[:5]
    archive_posts = News.objects.exclude(pk=pk).order_by('-date_posted')[:5]
    
    return render(request, 'store/news/news_detail.html', {'news': news,'recent_posts': recent_posts,'archive_posts':archive_posts})


