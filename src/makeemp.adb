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



end MakeEmp;
