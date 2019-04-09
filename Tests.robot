*** Settings ***

Library  DummyRestApi.py
Resource  Keywords.robot

Test Setup  Generate Random Name

*** Test Cases ***

Create New Employee
   Create New Employee and Verify it was created

Update Employee's Salary
    Update Employee Salary and Verify Salary has been updated

Delete Employee Record
    Delete Employee Record and Verify