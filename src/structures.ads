with Ada.Text_IO; use ada.Text_IO;

package structures is

   type JobType is (
      Programmer, Manager, Accountant, Analysist,
      Sales, Manufacturing, Inventory, SoftwareEngineer
   );

   package JobTypeIO is new Ada.Text_IO.Enumeration_IO(JobType);
   use JobTypeIO;

   type EmpName is (
      David, Kevin, Sam, Mary, Bob, Marty, Sable, Betty,
      Tom, Teddy, Jerry, Ben, Sara, Donald, Damon, Darlene,
      Dustin, Desire
   );

   package EmpNameIO is new Ada.Text_IO.Enumeration_IO(EmpName);
   use EmpNameIO;
   
     type Manufacturer is (
      Ford, GMC, Dodge, Chevrolet,
      GeneralDynamics, Grumman, Lockheed, Boeing
   );

   package Manufacturer_IO is new Ada.Text_IO.Enumeration_IO(Manufacturer);
   use Manufacturer_IO;

   type ModelName is (
      Expedition, Raptor, Pickup, Devil, Camaro, StingRay, Charger, Ram,
      F_16, Commercial, F35, B747
   );

   package ModelName_IO is new Ada.Text_IO.Enumeration_IO(ModelName);
   use ModelName_IO;

   type Color is (
      Blue, Red, White, Orange, Black, Silver, Camo
   );

   package Color_IO is new Ada.Text_IO.Enumeration_IO(Color);
   use Color_IO;
   
   type vehicle_type is abstract tagged record
      Manu: Manufacturer;
      Model: ModelName;
      VehColor: Color;
   end record;

   type Car is new vehicle_type with record
      Doors: Integer;
   end record;

   type Plane is new vehicle_type with record
      NumEngines: Integer;
   end record;
   
   type Vehicle_Node;
   type Vehicle_Ptr is access Vehicle_Node;
   
   type Vehicle_Node is record
   Data : access vehicle_type'Class;
   Next : Vehicle_Ptr := null;
   end record;

type Emp;
type Emp_Ptr is access all Emp;
type Emp is record
   Name: EmpName;
   Job: JobType;
   Age: Integer;
   VehiclesHead: Vehicle_Ptr := null;
   Next: Integer;
   Prev: Integer;
end record; 
procedure Add_Vehicle(Employee : in out Emp; Manu : Manufacturer; Model : ModelName; VehColor : Color; Is_Plane : Boolean; NumDoorsOrEngines : Integer);
end structures; 
