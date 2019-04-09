import names
import random
import requests
import json

import uuid
class DummyRestApi():

    def Create_Employee(self,Name,Salary,Age,URL):
        headers = {
            'accept': 'application/json',
        }



        data = {'name': Name, 'salary': Salary, 'age': Age, 'profile_image': 'http://random_url.org/image.jpg'}
        print (data)
        response = requests.post('http://dummy.restapiexample.com/api/v1/create', headers=headers,
                                 json=data)

        response.raise_for_status()
        response_body = response.json()
        print(type(response_body))
        return response_body

    def Get_Employee(self,Id):
        headers = {
            'accept': 'application/json',
            'Content-Type': 'application/json',
        }


        response = requests.get("http://dummy.restapiexample.com/api/v1/employee/" + Id,
                                 headers=headers)
        print(response.status_code)
        return response.json()
    def Check_For_Deleted_Employee(self,Id):
        headers = {
            'accept': 'application/json',
            'Content-Type': 'application/json',
        }


        response = requests.get("http://dummy.restapiexample.com/api/v1/employee/" + Id,
                                 headers=headers)
        print(response.status_code)
        return response.status_code


    def Update_Employee(self,Id,Name,Salary,Age):
        headers = {
            'accept': 'application/json',
        }

        data = {'name': Name, 'salary': Salary, 'age': Age, 'profile_image': 'http://random_url.org/image.jpg'}
        print (data)
        response = requests.put('	http://dummy.restapiexample.com/api/v1/update/' + Id, headers=headers,
                                 json=data)

        response.raise_for_status()
        response_body = response.json()
        print(type(response_body))
        return response_body
    def Delete_Employee(self,Id):
        headers = {
            'accept': 'application/json',
        }

        response = requests.delete('	http://dummy.restapiexample.com/api/v1/delete/' + Id, headers=headers,)

        response.raise_for_status()
        response_body = response.json()
        print(type(response_body))
        return response_body

    def Name(self):
        return str(uuid.uuid4())