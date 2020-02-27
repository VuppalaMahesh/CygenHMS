from rest_framework import serializers
from .models import *


class DepartmentSerializer(serializers.ModelSerializer):

    class Meta:
        model = Department
        fields = ('id', 'departmentName', 'contactName', 'phoneNumber')

#product serializer

class ProductSerializer(serializers.ModelSerializer):
    """
    ProductSerializer : Serializing product fields
    """
    category = serializers.SlugRelatedField(queryset=ProductCategory.objects.all(), slug_field='productCategory')

    class Meta:
        model = Product
        fields = ("id", "name", "category", "quantity", "description", "price", "productStatus")


class ProductCategorySerializer(serializers.ModelSerializer):
    """
    ProductCategorySerializer : Serializing product category fields
    """
    class Meta:
        model = ProductCategory
        fields = ("id", "productCategory")

#purchase serializer

class ProductListSerializer(serializers.ModelSerializer):
    class Meta:
        model = Productlist
        fields = ('id', 'productID','vendorID', 'quantity','purchaseorderid')


class PurchaseOrderSerializer(serializers.ModelSerializer):
    product_list = ProductListSerializer(many=True)
    requestedDepartment = serializers.SlugRelatedField(queryset=Department.objects.all(),
                                                       slug_field='departmentName')

    class Meta:
        model = PurchaseOrder
        fields = ('id', 'product_list', 'orderDate', 'requestedDate', 'requestedDepartment', 'remarks',
                  'purchaseStatus')

    def create(self, validated_data):
        product_data = validated_data.pop('product_list')
        purchase = PurchaseOrder.objects.create(**validated_data)
        for product in product_data:
            Productlist.objects.create(purchaseorderid=purchase, **product)
        return purchase

#vendor serializer

class VendorSerializer(serializers.ModelSerializer):

    class Meta:
        model = Vendor
        fields = ('id', 'name', 'phoneNumber', 'contactName', 'address', 'email', 'website', 'remarks', 'vendorStatus')
