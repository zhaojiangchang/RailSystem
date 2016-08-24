pragma Ada_95;
pragma Warnings (Off);
with System;
package ada_main is

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2016 (20160515-49)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_railsystems_harness" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#13987c83#;
   pragma Export (C, u00001, "railsystems_harnessB");
   u00002 : constant Version_32 := 16#b6df930e#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#ddf3267e#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#fa79b673#;
   pragma Export (C, u00004, "aunitB");
   u00005 : constant Version_32 := 16#76cdf7c6#;
   pragma Export (C, u00005, "aunitS");
   u00006 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00006, "adaS");
   u00007 : constant Version_32 := 16#b6c145a2#;
   pragma Export (C, u00007, "aunit__memoryB");
   u00008 : constant Version_32 := 16#fb5936b8#;
   pragma Export (C, u00008, "aunit__memoryS");
   u00009 : constant Version_32 := 16#2da59038#;
   pragma Export (C, u00009, "systemS");
   u00010 : constant Version_32 := 16#39a03df9#;
   pragma Export (C, u00010, "system__storage_elementsB");
   u00011 : constant Version_32 := 16#0066da3c#;
   pragma Export (C, u00011, "system__storage_elementsS");
   u00012 : constant Version_32 := 16#17d955ab#;
   pragma Export (C, u00012, "aunit__reporterS");
   u00013 : constant Version_32 := 16#da4d2671#;
   pragma Export (C, u00013, "ada__exceptionsB");
   u00014 : constant Version_32 := 16#4c8cceba#;
   pragma Export (C, u00014, "ada__exceptionsS");
   u00015 : constant Version_32 := 16#e947e6a9#;
   pragma Export (C, u00015, "ada__exceptions__last_chance_handlerB");
   u00016 : constant Version_32 := 16#41e5552e#;
   pragma Export (C, u00016, "ada__exceptions__last_chance_handlerS");
   u00017 : constant Version_32 := 16#5f84b5ab#;
   pragma Export (C, u00017, "system__soft_linksB");
   u00018 : constant Version_32 := 16#b321486d#;
   pragma Export (C, u00018, "system__soft_linksS");
   u00019 : constant Version_32 := 16#b01dad17#;
   pragma Export (C, u00019, "system__parametersB");
   u00020 : constant Version_32 := 16#538f9d47#;
   pragma Export (C, u00020, "system__parametersS");
   u00021 : constant Version_32 := 16#0f0cb66d#;
   pragma Export (C, u00021, "system__secondary_stackB");
   u00022 : constant Version_32 := 16#86c45f51#;
   pragma Export (C, u00022, "system__secondary_stackS");
   u00023 : constant Version_32 := 16#41837d1e#;
   pragma Export (C, u00023, "system__stack_checkingB");
   u00024 : constant Version_32 := 16#a31afbd0#;
   pragma Export (C, u00024, "system__stack_checkingS");
   u00025 : constant Version_32 := 16#87a448ff#;
   pragma Export (C, u00025, "system__exception_tableB");
   u00026 : constant Version_32 := 16#700bf97a#;
   pragma Export (C, u00026, "system__exception_tableS");
   u00027 : constant Version_32 := 16#ce4af020#;
   pragma Export (C, u00027, "system__exceptionsB");
   u00028 : constant Version_32 := 16#45c6fdce#;
   pragma Export (C, u00028, "system__exceptionsS");
   u00029 : constant Version_32 := 16#4c9e814d#;
   pragma Export (C, u00029, "system__exceptions__machineS");
   u00030 : constant Version_32 := 16#aa0563fc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#532f69fc#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#6c2f8802#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#2f7e70fa#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#39df8c17#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#73874efc#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#9ed49525#;
   pragma Export (C, u00036, "system__traceback_entriesB");
   u00037 : constant Version_32 := 16#2dfe6648#;
   pragma Export (C, u00037, "system__traceback_entriesS");
   u00038 : constant Version_32 := 16#d2b6296c#;
   pragma Export (C, u00038, "system__traceback__symbolicB");
   u00039 : constant Version_32 := 16#dd19f67a#;
   pragma Export (C, u00039, "system__traceback__symbolicS");
   u00040 : constant Version_32 := 16#701f9d88#;
   pragma Export (C, u00040, "ada__exceptions__tracebackB");
   u00041 : constant Version_32 := 16#20245e75#;
   pragma Export (C, u00041, "ada__exceptions__tracebackS");
   u00042 : constant Version_32 := 16#5d344636#;
   pragma Export (C, u00042, "system__crtlS");
   u00043 : constant Version_32 := 16#b6a35849#;
   pragma Export (C, u00043, "system__dwarf_linesB");
   u00044 : constant Version_32 := 16#44249c75#;
   pragma Export (C, u00044, "system__dwarf_linesS");
   u00045 : constant Version_32 := 16#12c24a43#;
   pragma Export (C, u00045, "ada__charactersS");
   u00046 : constant Version_32 := 16#8f637df8#;
   pragma Export (C, u00046, "ada__characters__handlingB");
   u00047 : constant Version_32 := 16#3b3f6154#;
   pragma Export (C, u00047, "ada__characters__handlingS");
   u00048 : constant Version_32 := 16#4b7bb96a#;
   pragma Export (C, u00048, "ada__characters__latin_1S");
   u00049 : constant Version_32 := 16#af50e98f#;
   pragma Export (C, u00049, "ada__stringsS");
   u00050 : constant Version_32 := 16#e2ea8656#;
   pragma Export (C, u00050, "ada__strings__mapsB");
   u00051 : constant Version_32 := 16#1e526bec#;
   pragma Export (C, u00051, "ada__strings__mapsS");
   u00052 : constant Version_32 := 16#4a6f6ca4#;
   pragma Export (C, u00052, "system__bit_opsB");
   u00053 : constant Version_32 := 16#0765e3a3#;
   pragma Export (C, u00053, "system__bit_opsS");
   u00054 : constant Version_32 := 16#1923ecbb#;
   pragma Export (C, u00054, "system__unsigned_typesS");
   u00055 : constant Version_32 := 16#92f05f13#;
   pragma Export (C, u00055, "ada__strings__maps__constantsS");
   u00056 : constant Version_32 := 16#5ab55268#;
   pragma Export (C, u00056, "interfacesS");
   u00057 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00057, "system__address_imageB");
   u00058 : constant Version_32 := 16#8c490d02#;
   pragma Export (C, u00058, "system__address_imageS");
   u00059 : constant Version_32 := 16#ec78c2bf#;
   pragma Export (C, u00059, "system__img_unsB");
   u00060 : constant Version_32 := 16#86d7d04c#;
   pragma Export (C, u00060, "system__img_unsS");
   u00061 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00061, "system__ioB");
   u00062 : constant Version_32 := 16#b3e76777#;
   pragma Export (C, u00062, "system__ioS");
   u00063 : constant Version_32 := 16#cf909744#;
   pragma Export (C, u00063, "system__object_readerB");
   u00064 : constant Version_32 := 16#6942daaf#;
   pragma Export (C, u00064, "system__object_readerS");
   u00065 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00065, "interfaces__cB");
   u00066 : constant Version_32 := 16#70be4e8c#;
   pragma Export (C, u00066, "interfaces__cS");
   u00067 : constant Version_32 := 16#1a74a354#;
   pragma Export (C, u00067, "system__val_lliB");
   u00068 : constant Version_32 := 16#b7817698#;
   pragma Export (C, u00068, "system__val_lliS");
   u00069 : constant Version_32 := 16#afdbf393#;
   pragma Export (C, u00069, "system__val_lluB");
   u00070 : constant Version_32 := 16#63d1bbc9#;
   pragma Export (C, u00070, "system__val_lluS");
   u00071 : constant Version_32 := 16#27b600b2#;
   pragma Export (C, u00071, "system__val_utilB");
   u00072 : constant Version_32 := 16#810526c6#;
   pragma Export (C, u00072, "system__val_utilS");
   u00073 : constant Version_32 := 16#d1060688#;
   pragma Export (C, u00073, "system__case_utilB");
   u00074 : constant Version_32 := 16#09acf9ef#;
   pragma Export (C, u00074, "system__case_utilS");
   u00075 : constant Version_32 := 16#84a27f0d#;
   pragma Export (C, u00075, "interfaces__c_streamsB");
   u00076 : constant Version_32 := 16#b1330297#;
   pragma Export (C, u00076, "interfaces__c_streamsS");
   u00077 : constant Version_32 := 16#931ff6be#;
   pragma Export (C, u00077, "system__exception_tracesB");
   u00078 : constant Version_32 := 16#097ab0a2#;
   pragma Export (C, u00078, "system__exception_tracesS");
   u00079 : constant Version_32 := 16#ce7de326#;
   pragma Export (C, u00079, "system__win32S");
   u00080 : constant Version_32 := 16#8c33a517#;
   pragma Export (C, u00080, "system__wch_conB");
   u00081 : constant Version_32 := 16#36d8b2ea#;
   pragma Export (C, u00081, "system__wch_conS");
   u00082 : constant Version_32 := 16#9721e840#;
   pragma Export (C, u00082, "system__wch_stwB");
   u00083 : constant Version_32 := 16#1bc99eeb#;
   pragma Export (C, u00083, "system__wch_stwS");
   u00084 : constant Version_32 := 16#a831679c#;
   pragma Export (C, u00084, "system__wch_cnvB");
   u00085 : constant Version_32 := 16#396f0819#;
   pragma Export (C, u00085, "system__wch_cnvS");
   u00086 : constant Version_32 := 16#ece6fdb6#;
   pragma Export (C, u00086, "system__wch_jisB");
   u00087 : constant Version_32 := 16#b91f1138#;
   pragma Export (C, u00087, "system__wch_jisS");
   u00088 : constant Version_32 := 16#10558b11#;
   pragma Export (C, u00088, "ada__streamsB");
   u00089 : constant Version_32 := 16#2e6701ab#;
   pragma Export (C, u00089, "ada__streamsS");
   u00090 : constant Version_32 := 16#db5c917c#;
   pragma Export (C, u00090, "ada__io_exceptionsS");
   u00091 : constant Version_32 := 16#920eada5#;
   pragma Export (C, u00091, "ada__tagsB");
   u00092 : constant Version_32 := 16#13ca27f3#;
   pragma Export (C, u00092, "ada__tagsS");
   u00093 : constant Version_32 := 16#c3335bfd#;
   pragma Export (C, u00093, "system__htableB");
   u00094 : constant Version_32 := 16#a96723d2#;
   pragma Export (C, u00094, "system__htableS");
   u00095 : constant Version_32 := 16#089f5cd0#;
   pragma Export (C, u00095, "system__string_hashB");
   u00096 : constant Version_32 := 16#0b3948ac#;
   pragma Export (C, u00096, "system__string_hashS");
   u00097 : constant Version_32 := 16#1d9142a4#;
   pragma Export (C, u00097, "system__val_unsB");
   u00098 : constant Version_32 := 16#098b0180#;
   pragma Export (C, u00098, "system__val_unsS");
   u00099 : constant Version_32 := 16#e99cd447#;
   pragma Export (C, u00099, "aunit__optionsS");
   u00100 : constant Version_32 := 16#e9d6512d#;
   pragma Export (C, u00100, "aunit__test_filtersB");
   u00101 : constant Version_32 := 16#9a67cba8#;
   pragma Export (C, u00101, "aunit__test_filtersS");
   u00102 : constant Version_32 := 16#6e9501f4#;
   pragma Export (C, u00102, "aunit__simple_test_casesB");
   u00103 : constant Version_32 := 16#f9679d50#;
   pragma Export (C, u00103, "aunit__simple_test_casesS");
   u00104 : constant Version_32 := 16#8872fb1a#;
   pragma Export (C, u00104, "aunit__assertionsB");
   u00105 : constant Version_32 := 16#3b7b7e5b#;
   pragma Export (C, u00105, "aunit__assertionsS");
   u00106 : constant Version_32 := 16#a83b7c85#;
   pragma Export (C, u00106, "system__concat_6B");
   u00107 : constant Version_32 := 16#ff62bd8a#;
   pragma Export (C, u00107, "system__concat_6S");
   u00108 : constant Version_32 := 16#608e2cd1#;
   pragma Export (C, u00108, "system__concat_5B");
   u00109 : constant Version_32 := 16#aafbd316#;
   pragma Export (C, u00109, "system__concat_5S");
   u00110 : constant Version_32 := 16#932a4690#;
   pragma Export (C, u00110, "system__concat_4B");
   u00111 : constant Version_32 := 16#53c1bb18#;
   pragma Export (C, u00111, "system__concat_4S");
   u00112 : constant Version_32 := 16#2b70b149#;
   pragma Export (C, u00112, "system__concat_3B");
   u00113 : constant Version_32 := 16#26d5cc9d#;
   pragma Export (C, u00113, "system__concat_3S");
   u00114 : constant Version_32 := 16#fd83e873#;
   pragma Export (C, u00114, "system__concat_2B");
   u00115 : constant Version_32 := 16#2f0547e8#;
   pragma Export (C, u00115, "system__concat_2S");
   u00116 : constant Version_32 := 16#11329e00#;
   pragma Export (C, u00116, "ada_containersS");
   u00117 : constant Version_32 := 16#3834a2e7#;
   pragma Export (C, u00117, "ada_containers__aunit_listsB");
   u00118 : constant Version_32 := 16#c8d9569a#;
   pragma Export (C, u00118, "ada_containers__aunit_listsS");
   u00119 : constant Version_32 := 16#9b1c7ff2#;
   pragma Export (C, u00119, "aunit__memory__utilsB");
   u00120 : constant Version_32 := 16#fb2f6c57#;
   pragma Export (C, u00120, "aunit__memory__utilsS");
   u00121 : constant Version_32 := 16#01adf261#;
   pragma Export (C, u00121, "aunit__test_resultsB");
   u00122 : constant Version_32 := 16#1087836e#;
   pragma Export (C, u00122, "aunit__test_resultsS");
   u00123 : constant Version_32 := 16#9df5edcf#;
   pragma Export (C, u00123, "aunit__time_measureB");
   u00124 : constant Version_32 := 16#f32b0de9#;
   pragma Export (C, u00124, "aunit__time_measureS");
   u00125 : constant Version_32 := 16#c5dcd3d2#;
   pragma Export (C, u00125, "ada__calendarB");
   u00126 : constant Version_32 := 16#12a38fcc#;
   pragma Export (C, u00126, "ada__calendarS");
   u00127 : constant Version_32 := 16#a99e1d66#;
   pragma Export (C, u00127, "system__os_primitivesB");
   u00128 : constant Version_32 := 16#a72a814e#;
   pragma Export (C, u00128, "system__os_primitivesS");
   u00129 : constant Version_32 := 16#b6166bc6#;
   pragma Export (C, u00129, "system__task_lockB");
   u00130 : constant Version_32 := 16#4c2fa756#;
   pragma Export (C, u00130, "system__task_lockS");
   u00131 : constant Version_32 := 16#1a9147da#;
   pragma Export (C, u00131, "system__win32__extS");
   u00132 : constant Version_32 := 16#6b6cea8f#;
   pragma Export (C, u00132, "aunit__testsS");
   u00133 : constant Version_32 := 16#6abe5dbe#;
   pragma Export (C, u00133, "system__finalization_mastersB");
   u00134 : constant Version_32 := 16#7659a9f2#;
   pragma Export (C, u00134, "system__finalization_mastersS");
   u00135 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00135, "system__img_boolB");
   u00136 : constant Version_32 := 16#d87ce1d3#;
   pragma Export (C, u00136, "system__img_boolS");
   u00137 : constant Version_32 := 16#cf417de3#;
   pragma Export (C, u00137, "ada__finalizationS");
   u00138 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00138, "system__finalization_rootB");
   u00139 : constant Version_32 := 16#6257e3a8#;
   pragma Export (C, u00139, "system__finalization_rootS");
   u00140 : constant Version_32 := 16#6d4d969a#;
   pragma Export (C, u00140, "system__storage_poolsB");
   u00141 : constant Version_32 := 16#0e480e95#;
   pragma Export (C, u00141, "system__storage_poolsS");
   u00142 : constant Version_32 := 16#5a895de2#;
   pragma Export (C, u00142, "system__pool_globalB");
   u00143 : constant Version_32 := 16#7141203e#;
   pragma Export (C, u00143, "system__pool_globalS");
   u00144 : constant Version_32 := 16#ee101ba4#;
   pragma Export (C, u00144, "system__memoryB");
   u00145 : constant Version_32 := 16#74d8f60c#;
   pragma Export (C, u00145, "system__memoryS");
   u00146 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00146, "gnatS");
   u00147 : constant Version_32 := 16#d43725a0#;
   pragma Export (C, u00147, "gnat__source_infoS");
   u00148 : constant Version_32 := 16#acb182ec#;
   pragma Export (C, u00148, "gnat__tracebackB");
   u00149 : constant Version_32 := 16#0701f3ba#;
   pragma Export (C, u00149, "gnat__tracebackS");
   u00150 : constant Version_32 := 16#85b06f15#;
   pragma Export (C, u00150, "gnat__traceback__symbolicS");
   u00151 : constant Version_32 := 16#9a578b55#;
   pragma Export (C, u00151, "aunit__reporter__textB");
   u00152 : constant Version_32 := 16#28ca7b1a#;
   pragma Export (C, u00152, "aunit__reporter__textS");
   u00153 : constant Version_32 := 16#b48102f5#;
   pragma Export (C, u00153, "gnat__ioB");
   u00154 : constant Version_32 := 16#6227e843#;
   pragma Export (C, u00154, "gnat__ioS");
   u00155 : constant Version_32 := 16#dde34de3#;
   pragma Export (C, u00155, "system__exp_intB");
   u00156 : constant Version_32 := 16#3486a6c4#;
   pragma Export (C, u00156, "system__exp_intS");
   u00157 : constant Version_32 := 16#f4e1c091#;
   pragma Export (C, u00157, "system__stream_attributesB");
   u00158 : constant Version_32 := 16#8bc30a4e#;
   pragma Export (C, u00158, "system__stream_attributesS");
   u00159 : constant Version_32 := 16#e11af2d7#;
   pragma Export (C, u00159, "aunit__runB");
   u00160 : constant Version_32 := 16#4b2a8016#;
   pragma Export (C, u00160, "aunit__runS");
   u00161 : constant Version_32 := 16#d01edb9b#;
   pragma Export (C, u00161, "aunit__test_suitesB");
   u00162 : constant Version_32 := 16#f3c7e671#;
   pragma Export (C, u00162, "aunit__test_suitesS");
   u00163 : constant Version_32 := 16#598b4149#;
   pragma Export (C, u00163, "railsystems_suiteB");
   u00164 : constant Version_32 := 16#20052983#;
   pragma Export (C, u00164, "railsystems_suiteS");
   u00165 : constant Version_32 := 16#54a4e2ba#;
   pragma Export (C, u00165, "railsystemsB");
   u00166 : constant Version_32 := 16#8029c2d2#;
   pragma Export (C, u00166, "railsystemsS");
   u00167 : constant Version_32 := 16#d5bfa9f3#;
   pragma Export (C, u00167, "ada__text_ioB");
   u00168 : constant Version_32 := 16#c3f01c15#;
   pragma Export (C, u00168, "ada__text_ioS");
   u00169 : constant Version_32 := 16#b29d05bd#;
   pragma Export (C, u00169, "system__file_ioB");
   u00170 : constant Version_32 := 16#8ad4715d#;
   pragma Export (C, u00170, "system__file_ioS");
   u00171 : constant Version_32 := 16#9dd55695#;
   pragma Export (C, u00171, "system__os_libB");
   u00172 : constant Version_32 := 16#bf5ce13f#;
   pragma Export (C, u00172, "system__os_libS");
   u00173 : constant Version_32 := 16#1a817b8e#;
   pragma Export (C, u00173, "system__stringsB");
   u00174 : constant Version_32 := 16#531a815e#;
   pragma Export (C, u00174, "system__stringsS");
   u00175 : constant Version_32 := 16#d03a0a90#;
   pragma Export (C, u00175, "system__file_control_blockS");
   u00176 : constant Version_32 := 16#7bfd81f3#;
   pragma Export (C, u00176, "listB");
   u00177 : constant Version_32 := 16#e7578cd9#;
   pragma Export (C, u00177, "listS");
   u00178 : constant Version_32 := 16#61c174a3#;
   pragma Export (C, u00178, "sprintB");
   u00179 : constant Version_32 := 16#16a9d7b0#;
   pragma Export (C, u00179, "sprintS");
   u00180 : constant Version_32 := 16#82bbdc2b#;
   pragma Export (C, u00180, "stationsB");
   u00181 : constant Version_32 := 16#d8a8cd6f#;
   pragma Export (C, u00181, "stationsS");
   u00182 : constant Version_32 := 16#a5a51326#;
   pragma Export (C, u00182, "tracksB");
   u00183 : constant Version_32 := 16#b979ad4b#;
   pragma Export (C, u00183, "tracksS");
   u00184 : constant Version_32 := 16#f6c303e6#;
   pragma Export (C, u00184, "typesS");
   u00185 : constant Version_32 := 16#f0efb6d9#;
   pragma Export (C, u00185, "trainsB");
   u00186 : constant Version_32 := 16#b2bebd0b#;
   pragma Export (C, u00186, "trainsS");
   u00187 : constant Version_32 := 16#64f75aee#;
   pragma Export (C, u00187, "railsystems__testB");
   u00188 : constant Version_32 := 16#588fb9dc#;
   pragma Export (C, u00188, "railsystems__testS");
   u00189 : constant Version_32 := 16#f9b5bb0c#;
   pragma Export (C, u00189, "aunit__test_casesB");
   u00190 : constant Version_32 := 16#b9f05298#;
   pragma Export (C, u00190, "aunit__test_casesS");
   u00191 : constant Version_32 := 16#6a86c9a5#;
   pragma Export (C, u00191, "system__storage_pools__subpoolsB");
   u00192 : constant Version_32 := 16#cc5a1856#;
   pragma Export (C, u00192, "system__storage_pools__subpoolsS");
   u00193 : constant Version_32 := 16#9aad1ff1#;
   pragma Export (C, u00193, "system__storage_pools__subpools__finalizationB");
   u00194 : constant Version_32 := 16#fe2f4b3a#;
   pragma Export (C, u00194, "system__storage_pools__subpools__finalizationS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  gnat%s
   --  gnat.io%s
   --  gnat.io%b
   --  gnat.source_info%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exp_int%s
   --  system.exp_int%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  system.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.unsigned_types%s
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  ada.exceptions.traceback%s
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.maps.constants%s
   --  ada.tags%s
   --  ada.streams%s
   --  ada.streams%b
   --  interfaces.c%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.exceptions.machine%s
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  system.exception_traces%s
   --  system.exception_traces%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.object_reader%s
   --  system.dwarf_lines%s
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  system.file_io%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  system.dwarf_lines%b
   --  system.object_reader%b
   --  system.address_image%b
   --  ada.exceptions.traceback%b
   --  system.traceback%s
   --  system.traceback%b
   --  gnat.traceback%s
   --  gnat.traceback%b
   --  system.traceback.symbolic%s
   --  system.traceback.symbolic%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  gnat.traceback.symbolic%s
   --  ada_containers%s
   --  ada_containers.aunit_lists%s
   --  aunit%s
   --  aunit.memory%s
   --  aunit.memory%b
   --  aunit%b
   --  aunit.memory.utils%s
   --  aunit.memory.utils%b
   --  ada_containers.aunit_lists%b
   --  aunit.tests%s
   --  aunit.test_filters%s
   --  aunit.options%s
   --  aunit.time_measure%s
   --  aunit.time_measure%b
   --  aunit.test_results%s
   --  aunit.test_results%b
   --  aunit.assertions%s
   --  aunit.assertions%b
   --  aunit.reporter%s
   --  aunit.reporter.text%s
   --  aunit.reporter.text%b
   --  aunit.simple_test_cases%s
   --  aunit.simple_test_cases%b
   --  aunit.test_filters%b
   --  aunit.test_cases%s
   --  aunit.test_cases%b
   --  aunit.test_suites%s
   --  aunit.test_suites%b
   --  aunit.run%s
   --  aunit.run%b
   --  list%s
   --  list%b
   --  railsystems_suite%s
   --  railsystems_harness%b
   --  sprint%s
   --  sprint%b
   --  types%s
   --  tracks%s
   --  tracks%b
   --  stations%s
   --  stations%b
   --  trains%s
   --  trains%b
   --  railsystems%s
   --  railsystems%b
   --  railsystems.test%s
   --  railsystems.test%b
   --  railsystems_suite%b
   --  END ELABORATION ORDER


end ada_main;
