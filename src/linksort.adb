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



begin
    Emp_List.Init(Emps, Avail);

   while Again in PositiveResponse loop

      Emp_List.Insert(Emps, Avail, MakeEmp);
      put("Enter another name (yup or nope): ");
      get(Again);
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
    Put(" , ");

    for Index in 1 .. Emps(Pt).Vehicle_Count loop
    declare
        Current_Vehicle : Vehicle_Ptr := Emps(Pt).Vehicles(Index);
    begin
        if Current_Vehicle /= null then
            -- Now safe to access members of Current_Vehicle
            Put(Manufacturer'Image(Current_Vehicle.all.Manu)); -- Note the use of .all
            Put("  ");
            Put(ModelName'Image(Current_Vehicle.all.Model));
            Put("  ");
            Put(Color'Image(Current_Vehicle.all.VehColor));
            Put("  ");

            -- Determine vehicle type and print specific info
            if Current_Vehicle.all in Car then
                Put(" Doors: ");
                Put(Integer'Image(Car(Current_Vehicle.all).Doors));
            elsif Current_Vehicle.all in Plane then
                Put(" Engines: ");
                Put(Integer'Image(Plane(Current_Vehicle.all).NumEngines));
            end if;
            -- Logic for printing "; " between vehicles remains unchanged
        end if;
    end;
end loop;


    Put_Line(""); -- Finish the line for the current employee
    Pt := Emps(Pt).Next; -- Proceed to the next employee
end loop;

 end loop;
end LinkSort;
