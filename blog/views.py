from django.shortcuts import render,HttpResponse

def main(request):
	return render(request,"index.html",{})

# Create your views here.
