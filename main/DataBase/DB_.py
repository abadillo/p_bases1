
from abc import abstractmethod, ABCMeta
import pyrebase

class DB(metaclass=ABCMeta):

    def __init__(self):
        
        config = {
            "apiKey": "AIzaSyAo4rbWcqpxxnBgp2Gx1XuWIFK57kAL08U",
            "authDomain": "delivery-ccs.firebaseapp.com",
            "databaseURL": "https://delivery-ccs.firebaseio.com",
            "projectId": "delivery-ccs",
            "storageBucket": "delivery-ccs.appspot.com",
            "messagingSenderId": "810906367390",
            "appId": "1:810906367390:web:d3eab3dc49d568f21e128f",
            "measurementId": "G-XKHZ50LRTJ"
        }
        
        firebase = pyrebase.initialize_app(config)

        self.db = firebase.database()

    @abstractmethod
    def get_id (self):
        pass
       
 



   
  
