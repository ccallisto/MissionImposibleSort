package body structures is

    procedure Add_Vehicle(Employee : in out Emp; Manu : Manufacturer; Model : ModelName; VehColor : Color; Is_Plane : Boolean; NumDoorsOrEngines : Integer) is
        New_Vehicle : Vehicle_Ptr := null;
    begin
        if Employee.Vehicle_Count < Employee.Vehicles'Length then
            if Is_Plane then
                New_Vehicle := new Plane'(Manu => Manu, Model => Model, VehColor => VehColor, NumEngines => NumDoorsOrEngines);
            else
                New_Vehicle := new Car'(Manu => Manu, Model => Model, VehColor => VehColor, Doors => NumDoorsOrEngines);
            end if;
            Employee.Vehicle_Count := Employee.Vehicle_Count + 1;
            Employee.Vehicles(Employee.Vehicle_Count) := New_Vehicle;
        else
            Ada.Text_IO.Put_Line("No more space for new vehicles for this employee.");
        end if;
    end Add_Vehicle;

end structures;
