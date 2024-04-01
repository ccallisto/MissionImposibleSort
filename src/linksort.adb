with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with DoublyLinkedList;
with structures; use structures;
with makeemp; use makeemp;

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




begin
    Emp_List.Init(Emps, Avail);

   while Again in PositiveResponse loop

      Emp_List.Insert(Emps, Avail, MakeEmp.MakeEmp);
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
            Put(Manufacturer'Image(Current_Vehicle.all.Manu));
            Put("  ");
            Put(ModelName'Image(Current_Vehicle.all.Model));
            Put("  ");
            Put(Color'Image(Current_Vehicle.all.VehColor));
            Put("  ");

            if Current_Vehicle.all in Car then
                Put(" Doors: ");
                Put(Integer'Image(Car(Current_Vehicle.all).Doors));
                Put(";");
            elsif Current_Vehicle.all in Plane then
                Put(" Engines: ");
                Put(Integer'Image(Plane(Current_Vehicle.all).NumEngines));
                Put(";");
             end if;

        end if;
    end;
end loop;


    Put_Line("");
    Pt := Emps(Pt).Next;
end loop;

 end loop;
end LinkSort;
