*** Settings ***


Library  DummyRestApi

*** Keywords ***
Generate Random Name
    ${Name}=  Name
    set suite variable  ${Name}

Create New Employee and Verify it was created

     ${Salary} =   Evaluate    random.randint(100, 10000)  modules=random
     ${Age} =   Evaluate    random.randint(18, 55)  modules=random
     ${URL} =    set variable  http//:image_Dummy.org/image.jpg
     ${Employee} =  Create Employee   ${Name}  ${Salary}  ${Age}  ${URL}
     log  ${Employee}
     ${Id} =  set variable  ${Employee['id']}
     ${Created_Employee} =  Get_Employee  ${Id}
     log   ${Created_Employee}
     should be equal as strings  ${Employee['id']}   ${Created_Employee['id']}

     set global variable  ${Id}

Update Employee Salary and Verify Salary has been updated
    Create New Employee and Verify it was created
    ${Created_Employee} =  Get_Employee  ${Id}
    ${Changed_Salary} =   Evaluate    random.randint(100, 10000)  modules=random
    ${Updated_Employee} =   Update_Employee  ${Id}  ${Created_Employee['employee_name']}  ${Changed_Salary}  ${Created_Employee['employee_age']}
    ${Changed_Employee} =  Get_Employee  ${Id}
    log  ${Changed_Employee['employee_salary']}
    log  ${Changed_Salary}
    should be equal as strings  ${Changed_Employee['employee_salary']}   ${Changed_Salary}

Delete Employee Record and Verify
     Create New Employee and Verify it was created
     ${Deleted_Employee} =  Delete_Employee  ${Id}
     should contain  ${Deleted_Employee}  success
     ${Verify_Deleted_Employee} =  Get_Employee  ${Id}
     should be equal   ${Verify_Deleted_Employee}  ${FALSE}





