with ada.Text_IO; use ada.Text_IO;
with structures; use structures;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
package body MakeEmp is

   function Get_JobType return JobType is
      gJob : JobType;
begin
    Put("Enter Job Type: ");
    JobTypeIO.Get(gJob);
    return gJob;
end Get_JobType;

function Get_Age return Integer is
    gAge : Integer;
begin
    Put("Enter Age: ");
          Ada.Integer_Text_IO.Get(gAge); 
      return gAge;
end Get_Age;

function Get_Model return ModelName is
    gModel : ModelName;
begin
    Put("Enter Vehicle Model: ");
    ModelName_IO.Get(gModel);
    return gModel;
end Get_Model;

function Get_Manu return Manufacturer is
    gManu : Manufacturer;
begin
    Put("Enter Manufacturer: ");
    Manufacturer_IO.Get(gManu);
    return gManu;
end Get_Manu;

function GetVehInt return Integer is
    doors : Integer;
begin
    Put("Enter Number of Doors/Engines");
    Get(Item => doors);
    return doors;
end GetVehInt;

function Get_Name return EmpName is
    gName : EmpName;
begin
    Put("Enter Employee Name: ");
    EmpNameIO.Get(gName);
    return gName;
end Get_Name;

function Get_Color return Color is
    gColor : Color;
begin
    Put("Enter Vehicle Color: ");
    Color_IO.Get(gColor);
    return gColor;
end Get_Color;

function MakeEmp return Emp is
    Employee : Emp;
    TempManu : Manufacturer;
    TempModel : ModelName;
    TempVehColor : Color;
    TempDoors : Integer;
    TempNumEngines : Integer;
    Is_Plane : Boolean;
begin
    Employee.Name := Get_Name;
    Employee.Job := Get_JobType;
    Employee.Age := Get_Age;

    TempManu := Get_Manu;
    TempModel := Get_Model;
    TempVehColor := Get_Color;
    TempDoors := GetVehInt; 

    Is_Plane := (TempManu = GeneralDynamics or TempManu = Grumman or TempManu = Lockheed or TempManu = Boeing);
    if Is_Plane then
        TempNumEngines := TempDoors;
    end if;

    Add_Vehicle(Employee, TempManu, TempModel, TempVehColor, Is_Plane, TempDoors);

    return Employee;
end MakeEmp;

end MakeEmp;
