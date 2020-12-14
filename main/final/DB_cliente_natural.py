
from DB import DB

class DB_cliente_natural(DB):

    def get_id (self):
        
        id = 1000

        try:
            userscursor = self.cursor.child("Business").get()

            for users in userscursor.each():
                if (int(users.key()) >= id):
                    id = int(users.key())

            userscursor = self.cursor.child("Client").get()

            for users in userscursor.each():
                if (int(users.key()) >= id):
                    id = int(users.key())

        except Exception:
            print("Vacio")

        return id + 1


   