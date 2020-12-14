from Application.DataBase.DB import DB
from Application.Logical.Directory.Client_Directory import Client_Directory
from Application.Data.User.Client import Client



class Client_Management(DB):


    def get_id (self):
        
        id = 1000

        try:
            usersdb = self.db.child("Business").get()

            for users in usersdb.each():
                if (int(users.key()) >= id):
                    id = int(users.key())

            usersdb = self.db.child("Client").get()

            for users in usersdb.each():
                if (int(users.key()) >= id):
                    id = int(users.key())

        except Exception:
            print("Vacio")

        return id + 1

    def get (self, id):
        try:
            user = Client("", "","","")
            userdb = self.db.child("Client").child(id).get()

            for users in userdb.each():
                if (users.key() == "Nombre"):
                    user.SetName(users.val())
                if (users.key() == "Email"):
                    user.SetEmail(users.val())
                if (users.key() == "Phone"):
                    user.SetPhone(users.val())
                if (users.key() == "Password"):
                    user.SetPassword(users.val())
                if (users.key() == "Balance"):
                    user.SetBalance(users.val())
                    print("")



            user.SetID(id)
            return user

        except Exception:
            print("No se encontro usuario")
            return None


    def gets (self):

        directorio = Client_Directory()
        usersdb = self.db.child("Client").get()

        try:
            for users in usersdb.each():
                if (users.val() != None):
                    directorio.AddRegistry(self.get(users.key()))
        except Exception:
            print("Error")

        return directorio

    def add(self, item, item2):

        user = item
        directorio = item2

        data = {
            'Nombre': user.GetName(),
            'Email': user.GetEmail(),
            'Phone': user.GetPhone(),
            'Password': user.GetPassword(),
            'Balance' : user.GetOrderBalance(),
        }

        id = self.get_id()

        #if (directorio.Verificar(user) == False):

        self.db.child("Client").child(id).set(data)
        user.SetID(id)
        directorio.AddRegistry(user)

        return user