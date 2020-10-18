(module
  (type (;0;) (func (param i32) (result i64)))
  (type (;1;) (func (param i64) (result i32)))
  (type (;2;) (func (param i64 i32 i64) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i64 i32) (result i32)))
  (type (;5;) (func (param i32 i32) (result i64)))
  (type (;6;) (func (param i32 i32 i64) (result i64)))
  (type (;7;) (func))
  (type (;8;) (func (result i32)))
  (type (;9;) (func (param i32) (result i32)))
  (type (;10;) (func (param i32 i32 i64) (result i32)))
  (type (;11;) (func (param i64 i64) (result i32)))
  (type (;12;) (func (result i64)))
  (type (;13;) (func (param i32 i32 i64 i64) (result i64)))
  (type (;14;) (func (param i64) (result i64)))
  (type (;15;) (func (param i64 i32) (result i64)))
  (type (;16;) (func (param i64 i32 i64) (result i64)))
  (type (;17;) (func (param i64 i32 i64 i64) (result i64)))
  (type (;18;) (func (param f32) (result i64)))
  (type (;19;) (func (param f64) (result i64)))
  (import "env" "print_string" (func (;0;) (type 9)))
  (import "env" "call_instance_method_0" (func (;1;) (type 15)))
  (import "env" "call_class_method_0" (func (;2;) (type 5)))
  (import "env" "call_instance_method_1" (func (;3;) (type 16)))
  (import "env" "alloc_array" (func (;4;) (type 12)))
  (import "env" "append_array" (func (;5;) (type 11)))
  (import "env" "alloc_string" (func (;6;) (type 0)))
  (import "env" "objc_class_append_property" (func (;7;) (type 10)))
  (import "env" "new_objc_nsstring" (func (;8;) (type 0)))
  (import "env" "call_class_method_1" (func (;9;) (type 6)))
  (import "env" "dealloc_object" (func (;10;) (type 1)))
  (import "env" "call_class_method_2" (func (;11;) (type 13)))
  (import "env" "alloc_objc_class" (func (;12;) (type 0)))
  (import "env" "call_instance_method_2" (func (;13;) (type 17)))
  (import "env" "replace_class_method" (func (;14;) (type 3)))
  (import "env" "replace_instance_method" (func (;15;) (type 3)))
  (import "env" "print_object" (func (;16;) (type 1)))
  (import "env" "new_objc_nsnumber_int" (func (;17;) (type 0)))
  (import "env" "alloc_int32" (func (;18;) (type 0)))
  (import "env" "alloc_int64" (func (;19;) (type 14)))
  (import "env" "alloc_float" (func (;20;) (type 18)))
  (import "env" "alloc_double" (func (;21;) (type 19)))
  (import "env" "call_class_method_param" (func (;22;) (type 6)))
  (import "env" "dealloc_array" (func (;23;) (type 1)))
  (import "env" "objc_allocate_class_pair" (func (;24;) (type 5)))
  (import "env" "objc_class_add_property" (func (;25;) (type 2)))
  (import "env" "objc_register_class_pair" (func (;26;) (type 1)))
  (func (;27;) (type 7)
    nop)
  (func (;28;) (type 4) (param i64 i32) (result i32)
    i32.const 1024
    call 0
    drop
    i32.const 0)
  (func (;29;) (type 2) (param i64 i32 i64) (result i32)
    i32.const 1053
    call 0
    drop
    i32.const 0)
  (func (;30;) (type 4) (param i64 i32) (result i32)
    i32.const 1097
    call 0
    drop
    i32.const 1126
    call 0
    drop
    local.get 0
    i32.const 1126
    call 1
    drop
    i32.const 0)
  (func (;31;) (type 2) (param i64 i32 i64) (result i32)
    i32.const 1138
    call 0
    drop
    i32.const 1182
    i32.const 1196
    call 2
    i32.const 1214
    call 1
    i32.const 1241
    i32.const 1224
    i32.const 1232
    call 2
    call 3
    drop
    i32.const 0)
  (func (;32;) (type 8) (result i32)
    (local i64 i64 i64 i64)
    call 4
    local.tee 0
    i32.const 1261
    call 6
    call 5
    drop
    local.get 0
    i32.const 1263
    call 6
    call 5
    drop
    local.get 0
    i32.const 1275
    call 6
    call 5
    drop
    local.get 0
    i32.const 1277
    call 6
    call 5
    drop
    local.get 0
    i32.const 1278
    call 6
    call 5
    drop
    local.get 0
    i32.const 1280
    call 6
    call 5
    drop
    i32.const 1285
    i32.const 1292
    local.get 0
    call 7
    drop
    i32.const 1285
    i32.const 1296
    call 2
    drop
    i32.const 1285
    i32.const 1322
    i32.const 1302
    call 8
    local.tee 0
    call 9
    drop
    local.get 0
    call 10
    drop
    i32.const 1285
    i32.const 1360
    i32.const 1331
    call 8
    local.tee 0
    i32.const 1349
    call 8
    local.tee 1
    call 11
    drop
    local.get 0
    call 10
    drop
    local.get 1
    call 10
    drop
    i32.const 1285
    call 12
    local.tee 0
    i32.const 1296
    call 1
    drop
    local.get 0
    call 10
    drop
    i32.const 1285
    call 12
    local.tee 0
    i32.const 1322
    i32.const 1302
    call 8
    local.tee 1
    call 3
    drop
    local.get 1
    call 10
    drop
    local.get 0
    call 10
    drop
    i32.const 1285
    call 12
    local.tee 2
    i32.const 1360
    i32.const 1331
    call 8
    local.tee 1
    i32.const 1349
    call 8
    local.tee 3
    call 13
    drop
    local.get 0
    i32.const 1374
    local.get 1
    call 3
    drop
    local.get 1
    call 10
    drop
    local.get 3
    call 10
    drop
    local.get 2
    call 10
    drop
    i32.const 1382
    i32.const 1392
    i32.const 1400
    call 14
    drop
    i32.const 1382
    i32.const 1427
    i32.const 1443
    call 14
    drop
    i32.const 1382
    i32.const 1392
    i32.const 1476
    call 15
    drop
    i32.const 1382
    i32.const 1427
    i32.const 1506
    call 15
    drop
    i32.const 1542
    call 0
    drop
    i32.const 1555
    call 8
    local.set 0
    i32.const 1560
    call 8
    local.set 1
    local.get 0
    call 16
    drop
    local.get 1
    call 16
    drop
    local.get 0
    call 10
    drop
    local.get 1
    call 10
    drop
    i32.const 1
    call 17
    local.tee 0
    call 16
    drop
    local.get 0
    call 10
    drop
    call 4
    local.tee 0
    i32.const 10
    call 18
    call 5
    drop
    local.get 0
    i64.const 666
    call 19
    call 5
    drop
    local.get 0
    f32.const 0x1.f147aep+2 (;=7.77;)
    call 20
    call 5
    drop
    local.get 0
    f64.const 0x1.9071c432ca57ap+7 (;=200.222;)
    call 21
    call 5
    drop
    local.get 0
    i32.const 1569
    call 8
    call 5
    drop
    local.get 0
    i32.const 1579
    call 6
    call 5
    drop
    i32.const 1285
    i32.const 1591
    local.get 0
    call 22
    drop
    local.get 0
    call 23
    drop
    i32.const 1285
    call 12
    i32.const 1629
    call 1
    local.tee 0
    call 16
    drop
    local.get 0
    i32.const 1634
    call 1
    call 16
    drop
    local.get 0
    i32.const 1374
    i32.const 1647
    call 8
    call 3
    drop
    local.get 0
    i32.const 1292
    call 1
    local.tee 1
    call 16
    drop
    local.get 1
    call 10
    drop
    local.get 0
    call 10
    drop
    i32.const 1654
    i32.const 1658
    call 24
    local.set 1
    call 4
    local.tee 0
    i32.const 1261
    call 6
    call 5
    drop
    local.get 0
    i32.const 1263
    call 6
    call 5
    drop
    local.get 0
    i32.const 1275
    call 6
    call 5
    drop
    local.get 0
    i32.const 1277
    call 6
    call 5
    drop
    local.get 0
    i32.const 1278
    call 6
    call 5
    drop
    local.get 0
    i32.const 1280
    call 6
    call 5
    drop
    local.get 1
    i32.const 1292
    local.get 0
    call 25
    drop
    local.get 1
    call 26
    drop
    i32.const 1654
    call 12
    i32.const 1629
    call 1
    local.tee 0
    i32.const 1374
    i32.const 1667
    call 8
    call 3
    drop
    local.get 0
    i32.const 1292
    call 1
    call 16
    drop
    i32.const 0)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1670))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 67216))
  (global (;4;) i32 (i32.const 0))
  (global (;5;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 27))
  (export "my_class_ReplaceMe_request" (func 28))
  (export "my_class_ReplaceMe_requestfromto" (func 29))
  (export "my_instance_ReplaceMe_request" (func 30))
  (export "my_instance_ReplaceMe_requestfromto" (func 31))
  (export "entry" (func 32))
  (export "__dso_handle" (global 0))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__memory_base" (global 4))
  (export "__table_base" (global 5))
  (data (;0;) (i32.const 1024) "replaced + ReplaceMe request\00replaced + ReplaceMe requestFrom:Two to:One\00replaced - ReplaceMe request\00wap_request\00replaced - ReplaceMe requestFrom:Two to:One\00UIApplication\00sharedApplication\00keyWindow\00UIColor\00redColor\00setBackgroundColor:\00T\00@\22NSString\22\00C\00\00V\00_xxx\00CallMe\00xxx\00sayHi\00I am from c program\00sayWord:\00How are you today\00I am happy\00sayYou:andMe:\00setXxx:\00ReplaceMe\00request\00my_class_ReplaceMe_request\00requestFrom:to:\00my_class_ReplaceMe_requestfromto\00my_instance_ReplaceMe_request\00my_instance_ReplaceMe_requestfromto\00hello matrix\00good\00 morning\00excellent\00WebAssembly\00callWithManyArguments:p1:p2:p3:p4:p5:\00init\00returnString\00setxxx\00FCK\00NSObject\00gg"))
