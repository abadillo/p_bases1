import pyrebase
import random
import json

from Application.DataBase.Business_Management import Business_Management
from Application.DataBase.Client_Management import Client_Management
from Application.DataBase.DB import DB
from Application.Logical.Directory.Client_Directory import Client_Directory
from Application.Logical.Directory.Business_Directory import Business_Directory
from Application.Data.User.Business import Business
from Application.Data.User.Client import Client
from Application.Data.Product.Product import Product
from Application.DataBase.Product_Management import Product_Management


db = Client_Management()

userlist = db.gets()

user1 = Client("DOmineg","ab22fd34","ppfdepje@gmail.com","12443995943")
user1 = db.add(user1,userlist)  




db1 = Business_Management()
userlist = db1.gets()
user1=Business("Ferreteria Inc","478953po","hfldsda@hotmail.com","04165958297","C628585696",["Comida","medicina"])
user1 = db1.add(user1,userlist)

#### no hay metodo para verificar correo duplicado



db = Product_Management()
p1 = Product("Acetaminofen","4$","Es una fruta","Limpieza")
#p2 = Product("iBUPROFENO","4$","Es una fruta","Comida")


user1 = db.add(p1,user1)
#user1 = db.add(p2,user1)


                  





















































from tkinter import *

window = Tk()
window.title("kkk")
window.geometry('650x500')

from tkinter import scrolledtext

lbl = Label(window, font=("Arial Bold", 10))
lbl.grid(column=0, row=0)

txt = scrolledtext.ScrolledText(window,font=("Arial Bold", 10))
txt.grid(column=0,row=14)


db = Client_Management()
userlist = db.gets()
txt.insert(INSERT,"Client\n")
for user in userlist.Registries:
     txt.insert(INSERT,("Id: " + str(user.GetID()) +  ", Name: "    +user.GetName()+ ", Email: " +user.GetEmail()+ ", Phone: " +str(user.GetPhone()) + "  \n"))

db = Business_Management()
userlist = db.gets()
txt.insert(INSERT, "\nBusiness\n")
for user in userlist.Registries:
    txt.insert(INSERT,("Id: "+ str(user.GetID()) +  ", Name: "    +user.GetName()+ ", Email: " +user.GetEmail()+ ", Phone: " +str(user.GetPhone())+ ", Rif: " +(user.GetRif())+ "  \n"))

  

window.mainloop()





