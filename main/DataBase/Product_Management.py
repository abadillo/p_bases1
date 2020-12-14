from Application.DataBase.DB import DB
from Application.Data.Product.Product import Product
import pyrebase


class Product_Management(DB):


    def get_id (self):

        id = 1000000

        try:
            productsdb = self.db.child("Product").get()

            for products in productsdb.each():
                if (int(products.key()) >= id):
                    id = int(products.key())

        except Exception:
            print("Products Vacio")

        return id + 1


    def get (self, id):
        try:
            product = Product("","","","")
            productdb = self.db.child("Product").child(id).get()

            for products in productdb.each():
                if (products.key() == "Nombre"):
                    product.SetName(products.val())
                if (products.key() == "Price"):
                    product.SetPrice(products.val())
                if (products.key() == "Description"):
                    product.SetDescription(products.val())
                if (products.key() == "Category"):
                    product.SetCategory(products.val())
                

            product.SetID(id)
            return product

        except Exception:
            print("No se encontro producto")
            return None

    def gets (self):
        return None


    def add(self, item, item2):

        product = item
        business = item2

        data = {
            'Nombre': product.GetName(),
            'Price': product.GetPrice(),
            'Description': product.GetDescription(),
            'Category': product.GetCategory(),
        }

        id = self.get_id()

        self.db.child("Product").child(id).set(data)
        product.SetID(id)



        inventario = {}
        
        for productIN in business.GetInventary():
            inventario[productIN.GetID()] = productIN.GetName()


        inventario[product.GetID()] = product.GetName()
        business.AddProduct(product)

        self.db.child("Business").child(business.GetID()).child("Inventario").set(inventario)


        return business



  


