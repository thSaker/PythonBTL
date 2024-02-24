from django .shortcuts import redirect,render
from django.contrib import messages
from store.forms import CustomUserForm
from django.contrib.auth import authenticate, login,logout

def register(request):
    form = CustomUserForm()
    if request.method== "POST":
        form= CustomUserForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request,"Sign Up Success")
            return redirect('/login')
    context = {'form':form}
    return render(request,"store/auth/register.html",context)

def loginpage(request):
    if request.user.is_authenticated:
        messages.warning(request,"You are signed in")
        return redirect('/')
    else:
        if request.method== "POST":
            name=request.POST.get('username')
            passwd=request.POST.get('password')
            
            user = authenticate(request,username=name,password=passwd)
            
            if user is not None:
                login(request,user)
                messages.success(request,"Logged in successfully")
                return redirect('/')
            else:
                messages.error(request,"Login unsuccessful")
                return redirect('/login')
            
        return render(request,"store/auth/login.html")
    
def logoutpage(request):
    if request.user.is_authenticated:
        logout(request)
        messages.success(request,"Signed out successfully")
    return redirect('/')