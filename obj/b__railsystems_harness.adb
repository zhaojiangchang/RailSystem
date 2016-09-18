pragma Ada_95;
pragma Warnings (Off);
pragma Source_File_Name (ada_main, Spec_File_Name => "b__railsystems_harness.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__railsystems_harness.adb");
pragma Suppress (Overflow_Check);
with Ada.Exceptions;

package body ada_main is

   E174 : Short_Integer; pragma Import (Ada, E174, "system__os_lib_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__soft_links_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exception_table_E");
   E090 : Short_Integer; pragma Import (Ada, E090, "ada__io_exceptions_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "ada__strings_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "ada__strings__maps_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__strings__maps__constants_E");
   E092 : Short_Integer; pragma Import (Ada, E092, "ada__tags_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "ada__streams_E");
   E066 : Short_Integer; pragma Import (Ada, E066, "interfaces__c_E");
   E028 : Short_Integer; pragma Import (Ada, E028, "system__exceptions_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "system__file_control_block_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__file_io_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "system__finalization_root_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "ada__finalization_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "system__storage_pools_E");
   E136 : Short_Integer; pragma Import (Ada, E136, "system__finalization_masters_E");
   E193 : Short_Integer; pragma Import (Ada, E193, "system__storage_pools__subpools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "ada__calendar_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__assertions_E");
   E064 : Short_Integer; pragma Import (Ada, E064, "system__object_reader_E");
   E044 : Short_Integer; pragma Import (Ada, E044, "system__dwarf_lines_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "system__pool_global_E");
   E022 : Short_Integer; pragma Import (Ada, E022, "system__secondary_stack_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "system__traceback__symbolic_E");
   E170 : Short_Integer; pragma Import (Ada, E170, "ada__text_io_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "ada_containers__aunit_lists_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "aunit_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "aunit__memory_E");
   E120 : Short_Integer; pragma Import (Ada, E120, "aunit__memory__utils_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "aunit__tests_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "aunit__test_filters_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "aunit__time_measure_E");
   E122 : Short_Integer; pragma Import (Ada, E122, "aunit__test_results_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "aunit__assertions_E");
   E012 : Short_Integer; pragma Import (Ada, E012, "aunit__reporter_E");
   E154 : Short_Integer; pragma Import (Ada, E154, "aunit__reporter__text_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "aunit__simple_test_cases_E");
   E191 : Short_Integer; pragma Import (Ada, E191, "aunit__test_cases_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "aunit__test_suites_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "aunit__run_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "list_E");
   E166 : Short_Integer; pragma Import (Ada, E166, "railsystems_suite_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "types_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "sprint_E");
   E185 : Short_Integer; pragma Import (Ada, E185, "stations_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "railsystems_E");
   E189 : Short_Integer; pragma Import (Ada, E189, "railsystems__test_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      declare
         procedure F1;
         pragma Import (Ada, F1, "railsystems_suite__finalize_body");
      begin
         E166 := E166 - 1;
         F1;
      end;
      E189 := E189 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "railsystems__test__finalize_spec");
      begin
         F2;
      end;
      E164 := E164 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "aunit__test_suites__finalize_spec");
      begin
         F3;
      end;
      E191 := E191 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "aunit__test_cases__finalize_spec");
      begin
         F4;
      end;
      E101 := E101 - 1;
      E103 := E103 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "aunit__simple_test_cases__finalize_spec");
      begin
         F5;
      end;
      E154 := E154 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "aunit__reporter__text__finalize_spec");
      begin
         F6;
      end;
      E105 := E105 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "aunit__assertions__finalize_spec");
      begin
         F7;
      end;
      E122 := E122 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "aunit__test_results__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "aunit__test_filters__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "aunit__tests__finalize_spec");
      begin
         E134 := E134 - 1;
         F10;
      end;
      E170 := E170 - 1;
      declare
         procedure F11;
         pragma Import (Ada, F11, "ada__text_io__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__file_io__finalize_body");
      begin
         E172 := E172 - 1;
         F12;
      end;
      E136 := E136 - 1;
      E193 := E193 - 1;
      E145 := E145 - 1;
      declare
         procedure F13;
         pragma Import (Ada, F13, "system__pool_global__finalize_spec");
      begin
         F13;
      end;
      declare
         procedure F14;
         pragma Import (Ada, F14, "system__storage_pools__subpools__finalize_spec");
      begin
         F14;
      end;
      declare
         procedure F15;
         pragma Import (Ada, F15, "system__finalization_masters__finalize_spec");
      begin
         F15;
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
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");

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
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");
      Bind_Env_Addr : System.Address;
      pragma Import (C, Bind_Env_Addr, "__gl_bind_env_addr");

      procedure Runtime_Initialize (Install_Handler : Integer);
      pragma Import (C, Runtime_Initialize, "__gnat_runtime_initialize");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
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
      Leap_Seconds_Support := 0;

      Runtime_Initialize (1);

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E026 := E026 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E090 := E090 + 1;
      Ada.Strings'Elab_Spec;
      E049 := E049 + 1;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E055 := E055 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E089 := E089 + 1;
      Interfaces.C'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E028 := E028 + 1;
      System.File_Control_Block'Elab_Spec;
      E177 := E177 + 1;
      System.Finalization_Root'Elab_Spec;
      E141 := E141 + 1;
      Ada.Finalization'Elab_Spec;
      E139 := E139 + 1;
      System.Storage_Pools'Elab_Spec;
      E143 := E143 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E126 := E126 + 1;
      System.Assertions'Elab_Spec;
      E133 := E133 + 1;
      System.Object_Reader'Elab_Spec;
      System.Dwarf_Lines'Elab_Spec;
      System.Pool_Global'Elab_Spec;
      E145 := E145 + 1;
      E193 := E193 + 1;
      System.Finalization_Masters'Elab_Body;
      E136 := E136 + 1;
      System.File_Io'Elab_Body;
      E172 := E172 + 1;
      E066 := E066 + 1;
      Ada.Tags'Elab_Body;
      E092 := E092 + 1;
      E051 := E051 + 1;
      System.Soft_Links'Elab_Body;
      E018 := E018 + 1;
      System.Os_Lib'Elab_Body;
      E174 := E174 + 1;
      System.Secondary_Stack'Elab_Body;
      E022 := E022 + 1;
      E044 := E044 + 1;
      E064 := E064 + 1;
      System.Traceback.Symbolic'Elab_Body;
      E039 := E039 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E170 := E170 + 1;
      E008 := E008 + 1;
      E005 := E005 + 1;
      E120 := E120 + 1;
      E118 := E118 + 1;
      Aunit.Tests'Elab_Spec;
      E134 := E134 + 1;
      Aunit.Test_Filters'Elab_Spec;
      Aunit.Time_Measure'Elab_Spec;
      E124 := E124 + 1;
      Aunit.Test_Results'Elab_Spec;
      E122 := E122 + 1;
      Aunit.Assertions'Elab_Spec;
      Aunit.Assertions'Elab_Body;
      E105 := E105 + 1;
      Aunit.Reporter'Elab_Spec;
      E012 := E012 + 1;
      Aunit.Reporter.Text'Elab_Spec;
      E154 := E154 + 1;
      Aunit.Simple_Test_Cases'Elab_Spec;
      E103 := E103 + 1;
      E101 := E101 + 1;
      Aunit.Test_Cases'Elab_Spec;
      E191 := E191 + 1;
      Aunit.Test_Suites'Elab_Spec;
      E164 := E164 + 1;
      E162 := E162 + 1;
      E184 := E184 + 1;
      TYPES'ELAB_SPEC;
      E182 := E182 + 1;
      E179 := E179 + 1;
      Stations'Elab_Spec;
      E185 := E185 + 1;
      RAILSYSTEMS'ELAB_SPEC;
      E168 := E168 + 1;
      Railsystems.Test'Elab_Spec;
      Railsystems.Test'Elab_Body;
      E189 := E189 + 1;
      Railsystems_Suite'Elab_Body;
      E166 := E166 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_railsystems_harness");

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
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\ada_containers.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-memory.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-memory-utils.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\ada_containers-aunit_lists.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-tests.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-options.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-time_measure.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-test_results.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-assertions.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-reporter.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-reporter-text.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-simple_test_cases.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-test_filters.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-test_cases.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-test_suites.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\aunit-run.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\List.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\RailSystems_harness.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\types.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\sPrint.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\Tracks.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\Stations.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\Trains.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\RailSystems.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\RailSystems-test.o
   --   C:\Users\JackyChang\Desktop\RailSystem2\obj\RailSystems_suite.o
   --   -LC:\Users\JackyChang\Desktop\RailSystem2\obj\
   --   -LC:\Users\JackyChang\Desktop\RailSystem2\obj\
   --   -LC:/gnat/2016/lib/gcc/i686-pc-mingw32/4.9.4/adalib/
   --   -static
   --   -lgnat
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
