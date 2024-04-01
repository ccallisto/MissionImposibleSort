pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__linksort.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__linksort.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E079 : Short_Integer; pragma Import (Ada, E079, "system__os_lib_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__exceptions_E");
   E011 : Short_Integer; pragma Import (Ada, E011, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E046 : Short_Integer; pragma Import (Ada, E046, "ada__containers_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "ada__io_exceptions_E");
   E030 : Short_Integer; pragma Import (Ada, E030, "ada__numerics_E");
   E061 : Short_Integer; pragma Import (Ada, E061, "ada__strings_E");
   E063 : Short_Integer; pragma Import (Ada, E063, "ada__strings__maps_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "ada__strings__maps__constants_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "interfaces__c_E");
   E024 : Short_Integer; pragma Import (Ada, E024, "system__exceptions_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__object_reader_E");
   E056 : Short_Integer; pragma Import (Ada, E056, "system__dwarf_lines_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "system__soft_links__initialize_E");
   E045 : Short_Integer; pragma Import (Ada, E045, "system__traceback__symbolic_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__img_int_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "system__img_uns_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "ada__strings__utf_encoding_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada__tags_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__strings__text_buffers_E");
   E106 : Short_Integer; pragma Import (Ada, E106, "ada__streams_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__file_control_block_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__finalization_root_E");
   E131 : Short_Integer; pragma Import (Ada, E131, "ada__finalization_E");
   E130 : Short_Integer; pragma Import (Ada, E130, "system__file_io_E");
   E158 : Short_Integer; pragma Import (Ada, E158, "system__storage_pools_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__finalization_masters_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "system__storage_pools__subpools_E");
   E104 : Short_Integer; pragma Import (Ada, E104, "ada__text_io_E");
   E160 : Short_Integer; pragma Import (Ada, E160, "system__pool_global_E");
   E142 : Short_Integer; pragma Import (Ada, E142, "system__img_llli_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__img_lli_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "structures_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "doublylinkedlist_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "structures__finalize_body");
      begin
         E154 := E154 - 1;
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "structures__finalize_spec");
      begin
         F2;
      end;
      E160 := E160 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__pool_global__finalize_spec");
      begin
         F3;
      end;
      E104 := E104 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "ada__text_io__finalize_spec");
      begin
         F4;
      end;
      E164 := E164 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__storage_pools__subpools__finalize_spec");
      begin
         F5;
      end;
      E156 := E156 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__finalization_masters__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "system__file_io__finalize_body");
      begin
         E130 := E130 - 1;
         F7;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (Ada, s_stalib_adafinal, "system__standard_library__adafinal");

      procedure Runtime_Finalize;
      pragma Import (C, Runtime_Finalize, "__gnat_runtime_finalize");

   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      Runtime_Finalize;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;
   pragma Favor_Top_Level (No_Param_Proc);

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      Ada.Exceptions'Elab_Spec;
      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E023 := E023 + 1;
      Ada.Containers'Elab_Spec;
      E046 := E046 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E074 := E074 + 1;
      Ada.Numerics'Elab_Spec;
      E030 := E030 + 1;
      Ada.Strings'Elab_Spec;
      E061 := E061 + 1;
      Ada.Strings.Maps'Elab_Spec;
      E063 := E063 + 1;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E066 := E066 + 1;
      Interfaces.C'Elab_Spec;
      E051 := E051 + 1;
      System.Exceptions'Elab_Spec;
      E024 := E024 + 1;
      System.Object_Reader'Elab_Spec;
      E088 := E088 + 1;
      System.Dwarf_Lines'Elab_Spec;
      System.Os_Lib'Elab_Body;
      E079 := E079 + 1;
      System.Soft_Links.Initialize'Elab_Body;
      E019 := E019 + 1;
      E011 := E011 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E045 := E045 + 1;
      System.Img_Int'Elab_Spec;
      E029 := E029 + 1;
      E006 := E006 + 1;
      System.Img_Uns'Elab_Spec;
      E069 := E069 + 1;
      E056 := E056 + 1;
      Ada.Strings.Utf_Encoding'Elab_Spec;
      E110 := E110 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Tags'Elab_Body;
      E118 := E118 + 1;
      Ada.Strings.Text_Buffers'Elab_Spec;
      E108 := E108 + 1;
      Ada.Streams'Elab_Spec;
      E106 := E106 + 1;
      System.File_Control_Block'Elab_Spec;
      E134 := E134 + 1;
      System.Finalization_Root'Elab_Spec;
      E133 := E133 + 1;
      Ada.Finalization'Elab_Spec;
      E131 := E131 + 1;
      System.File_Io'Elab_Body;
      E130 := E130 + 1;
      System.Storage_Pools'Elab_Spec;
      E158 := E158 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Finalization_Masters'Elab_Body;
      E156 := E156 + 1;
      System.Storage_Pools.Subpools'Elab_Spec;
      E164 := E164 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E104 := E104 + 1;
      System.Pool_Global'Elab_Spec;
      E160 := E160 + 1;
      System.Img_Llli'Elab_Spec;
      E142 := E142 + 1;
      System.Img_Lli'Elab_Spec;
      E139 := E139 + 1;
      structures'elab_spec;
      structures'elab_body;
      E154 := E154 + 1;
      E152 := E152 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_linksort");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      if gnat_argc = 0 then
         gnat_argc := argc;
         gnat_argv := argv;
      end if;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /home/callisto/Desktop/DSA/Lab2/MissionImpossibleSort/obj/structures.o
   --   /home/callisto/Desktop/DSA/Lab2/MissionImpossibleSort/obj/doublylinkedlist.o
   --   /home/callisto/Desktop/DSA/Lab2/MissionImpossibleSort/obj/linksort.o
   --   -L/home/callisto/Desktop/DSA/Lab2/MissionImpossibleSort/obj/
   --   -L/home/callisto/Desktop/DSA/Lab2/MissionImpossibleSort/obj/
   --   -L/usr/lib/gcc/x86_64-redhat-linux/13/adalib/
   --   -static
   --   -lgnat
   --   -ldl
--  END Object file/option list   

end ada_main;
