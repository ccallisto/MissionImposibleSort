with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with DoublyLinkedList;
with structures; use structures;

procedure LinkSort is
    type LegalResponse is (yup, affirmative, nope, negative);
    subtype PositiveResponse is LegalResponse range yup..affirmative;
    package LegalIO is new Ada.Text_IO.Enumeration_IO(LegalResponse);
    use LegalIO;

   package Emp_List is new DoublyLinkedList(Emp, 100);
    Emps : Emp_List.ListArr(1..100);
    Avail : Integer := 0;
    Again: LegalResponse := affirmative;
    Pt: Integer;
    SortByJob: Array(JobType) of Integer := (others => 0);


   --funcions for inserting into list; weird solution but works
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
    Get(Item => gAge);
    return gAge;
end Get_Age;

function Get_Model return ModelName is
    gModel : ModelName;
begin
    Put("Enter Vehicle Model: ");
    ModelName_IO.Get(gModel); -- Corrected to use the right IO package
    return gModel;
end Get_Model;

function Get_Manu return Manufacturer is
    gManu : Manufacturer;
begin
    Put("Enter Manufacturer: ");
    Manufacturer_IO.Get(gManu); -- Corrected to use the right IO package
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
    Put("Enter Employee Name: "); -- Corrected prompt for clarity
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
    TempDoors : Integer;
    TempNumEngines : Integer;
    TempVehColor : Color;
begin
    Employee.Name := Get_Name;
    Employee.Job := Get_JobType;
    Employee.Age := Get_Age;

    TempManu := Get_Manu;
    TempModel := Get_Model;
    TempDoors := GetVehInt;
    TempVehColor := Get_Color;



    if TempManu = GeneralDynamics or TempManu = Grumman or TempManu = Lockheed or TempManu = Boeing then

        TempNumEngines := TempDoors;
        Employee.Vehicle := new Plane'(Manu => TempManu, Model => TempModel, VehColor => TempVehColor, NumEngines => TempNumEngines);
    else
        Employee.Vehicle := new Car'(Manu => TempManu, Model => TempModel, VehColor => TempVehColor, Doors => TempDoors);
    end if;

    return Employee;
end MakeEmp;



begin
    Emp_List.Init(Emps, Avail);

    while Again in PositiveResponse loop
        Emp_List.Insert(Emps, Avail, MakeEmp);
        Put("Enter another name (yup or nope): ");
        LegalIO.Get(Again);
    end loop;

   for J in JobType loop
      --init heads
            SortByJob(J) := 0;
        end loop;
--set
        for I in 1 .. Avail-1 loop
            if SortByJob(Emps(I).Job) = 0 then
                SortByJob(Emps(I).Job) := I;
            end if;
    end loop;
    for I in JobType loop
        New_Line;
        Put("Job Type = " & JobType'Image(I));
        New_Line;

        Pt := SortByJob(I);
        if Pt /= 0 then
            Pt := Emps(Pt).Next;
        end if;

      while Pt /= 0 loop
   Put(EmpName'Image(Emps(Pt).Name));
   Put(" ");
   Put(Integer'Image(Emps(Pt).Age));
   Put(" ");
   Put(JobType'Image(Emps(Pt).Job));
      if Emps(Pt).Vehicle /= null then
      Put(" , ");
      Put(Manufacturer'Image(Emps(Pt).Vehicle.Manu));
      Put("  ");
      Put(ModelName'Image(Emps(Pt).Vehicle.Model));
      Put("  ");
      Put(Color'Image(Emps(Pt).Vehicle.VehColor));
      Put("  ");
      if Emps(Pt).Vehicle.all in Car then
         Put(" Doors: ");
         Put(Integer'Image(Car(Emps(Pt).Vehicle.all).Doors));
      elsif Emps(Pt).Vehicle.all in Plane then
         Put(" Engines: ");
         Put(Integer'Image(Plane(Emps(Pt).Vehicle.all).NumEngines));
      end if;
   end if;
   Put(" link = ");
   Put(Integer'Image(Emps(Pt).Next));
   New_Line;



   New_Line;
   Pt := Emps(Pt).Next;
      end loop;
      end loop;
end LinkSort;
