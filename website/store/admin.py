from django.contrib import admin
from . models import *
from django.urls import path
from django.db.models.functions import TruncDay
from django.db.models import Count
from django.core.serializers.json import DjangoJSONEncoder
import json



class OrderAdmin(admin.ModelAdmin):
    # change_list.html
    def changelist_view(self, request, extra_context=None):
        # Aggregate new authors per day
        chart_data = (
            Order.objects.annotate(date=TruncDay("created_at"))
            .values("date")
            .annotate(y=Count("id"))
            .order_by("-date")
        )
        # Serialize and attach the chart data to the template context
        as_json = json.dumps(list(chart_data), cls=DjangoJSONEncoder)
        print("Json %s"%as_json)
        extra_context = extra_context or {"chart_data": as_json}
        # Call the superclass changelist_view to render the page

        return super().changelist_view(request, extra_context=extra_context)

# Register your models here.
admin.site.register(Category)
admin.site.register(Product)
admin.site.register(Cart)
admin.site.register(Order, OrderAdmin)
admin.site.register(OrderItem)
admin.site.register(Profile)
admin.site.register(News)