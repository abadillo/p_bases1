from abc import ABCMeta, abstractmethod
from Application.Data.Balance.Balance import Balance

class User(metaclass=ABCMeta):
    __Password=""
    __ID=""
    _Balance = Balance
    def __init__(self,*Data):
        self.AddData(Data)
        self._Balance=Balance()

#METHODS
    #DICHO METODO DEFINE LA CONTRASEÑA DEL USUARIO
    def SetPassword(self,Password):
           if(self.ValidatePassword(Password)):
               self.__Password=Password
           else:
               #CONTRASEÑA NO VALIDA,DEFINIR ESTA PARTE
                pass

    def GetPassword (self):
        return self.__Password

    #DICHO METODO VALIDA LA CONTRASEÑA DEL USUARIO
    def ValidatePassword(self,Password):
        if(Password == self.__Password or Password == ""):
            return True
        else:
            return False

    # DICHO METODO DEFINE EL CORREO DEL USUARIO
    def SetEmail(self,Email):
        self.Email=Email

    # DICHO METODO DEVUELVE EL CORREO DEL USUARIO
    def GetEmail(self):
        return self.Email

    # DICHO METODO DEFINE EL NOMBRE DEL USUARIO
    def SetName (self, Name):
        if (type(Name)== str):
            self.UserName = Name

    # DICHO METODO DEVUELVE EL NOMBRE DEL USUARIO
    def GetName (self):
        return self.UserName.lower()

    # DICHO METODO DEFINE EL TELEFONO DEL USUARIO
    def SetPhone (self, Phone):
        self.Phone = Phone


    # DICHO METODO DEVUELVE EL TELEFONO DEL USUARIO
    def GetPhone (self):
        return self.Phone

    def SetAddress(self, Address):
        self.Address=Address

    def GetAddress(self):
        return self.Address

    # DICHO METODO DEFINE EL ID DEL USUARIO
    def SetID(self,ID):
        self.__ID=ID

    # DICHO METODO DEVUELVE EL ID DEL USUARIO
    def GetID(self):
        return self.__ID

    # DICHO METODO DEVUELVE EL BALANCE PROPIO
    def GetBalance(self):
        return self._Balance.getbalance()

    def GetObjectBalance(self):
        return self._Balance.tojson()

    def SetBalance(self,JsonDicc):
        self._Balance.toobject(JsonDicc)

    def Transference(self,Paymetod):
        self._Balance.addmoney(Paymetod)

    def GetAccounting(self,TypeCash):
        return self._Balance.GetAccounting(TypeCash)

    @abstractmethod
    def AddData (self, *Data):
        pass
