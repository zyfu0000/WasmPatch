(module
  (type (;0;) (func (param i32) (result i64)))
  (type (;1;) (func (param i64) (result i32)))
  (type (;2;) (func (param i32 i32 i32) (result i32)))
  (type (;3;) (func (param i64 i32) (result i32)))
  (type (;4;) (func (param i64 i32 i64) (result i32)))
  (type (;5;) (func (param i32 i32 i64) (result i64)))
  (type (;6;) (func))
  (type (;7;) (func (result i32)))
  (type (;8;) (func (param i32) (result i32)))
  (type (;9;) (func (param i64 i64) (result i32)))
  (type (;10;) (func (result i64)))
  (type (;11;) (func (param i32 i32) (result i64)))
  (type (;12;) (func (param i32 i32 i64 i64) (result i64)))
  (type (;13;) (func (param i64) (result i64)))
  (type (;14;) (func (param i64 i32) (result i64)))
  (type (;15;) (func (param i64 i32 i64) (result i64)))
  (type (;16;) (func (param i64 i32 i64 i64) (result i64)))
  (type (;17;) (func (param f32) (result i64)))
  (type (;18;) (func (param f64) (result i64)))
  (import "env" "print_string" (func (;0;) (type 8)))
  (import "env" "call_instance_method_0" (func (;1;) (type 14)))
  (import "env" "call_class_method_0" (func (;2;) (type 11)))
  (import "env" "call_instance_method_1" (func (;3;) (type 15)))
  (import "env" "new_objc_nsstring" (func (;4;) (type 0)))
  (import "env" "call_class_method_1" (func (;5;) (type 5)))
  (import "env" "dealloc_object" (func (;6;) (type 1)))
  (import "env" "call_class_method_2" (func (;7;) (type 12)))
  (import "env" "alloc_objc_class" (func (;8;) (type 0)))
  (import "env" "call_instance_method_2" (func (;9;) (type 16)))
  (import "env" "replace_class_method" (func (;10;) (type 2)))
  (import "env" "replace_instance_method" (func (;11;) (type 2)))
  (import "env" "print_object" (func (;12;) (type 1)))
  (import "env" "new_objc_nsnumber_int" (func (;13;) (type 0)))
  (import "env" "alloc_array" (func (;14;) (type 10)))
  (import "env" "append_array" (func (;15;) (type 9)))
  (import "env" "alloc_int32" (func (;16;) (type 0)))
  (import "env" "alloc_int64" (func (;17;) (type 13)))
  (import "env" "alloc_float" (func (;18;) (type 17)))
  (import "env" "alloc_double" (func (;19;) (type 18)))
  (import "env" "alloc_string" (func (;20;) (type 0)))
  (import "env" "call_class_method_param" (func (;21;) (type 5)))
  (import "env" "dealloc_array" (func (;22;) (type 1)))
  (func (;23;) (type 6)
    nop)
  (func (;24;) (type 3) (param i64 i32) (result i32)
    i32.const 1024
    call 0
    drop
    i32.const 0)
  (func (;25;) (type 4) (param i64 i32 i64) (result i32)
    i32.const 1053
    call 0
    drop
    i32.const 0)
  (func (;26;) (type 3) (param i64 i32) (result i32)
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
  (func (;27;) (type 4) (param i64 i32 i64) (result i32)
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
  (func (;28;) (type 7) (result i32)
    (local i64 i64 i64)
    i32.const 1261
    i32.const 1268
    call 2
    drop
    i32.const 1261
    i32.const 1294
    i32.const 1274
    call 4
    local.tee 0
    call 5
    drop
    local.get 0
    call 6
    drop
    i32.const 1261
    i32.const 1332
    i32.const 1303
    call 4
    local.tee 0
    i32.const 1321
    call 4
    local.tee 1
    call 7
    drop
    local.get 0
    call 6
    drop
    local.get 1
    call 6
    drop
    i32.const 1261
    call 8
    local.tee 0
    i32.const 1268
    call 1
    drop
    local.get 0
    call 6
    drop
    i32.const 1261
    call 8
    local.tee 0
    i32.const 1294
    i32.const 1274
    call 4
    local.tee 1
    call 3
    drop
    local.get 1
    call 6
    drop
    local.get 0
    call 6
    drop
    i32.const 1261
    call 8
    local.tee 0
    i32.const 1332
    i32.const 1303
    call 4
    local.tee 1
    i32.const 1321
    call 4
    local.tee 2
    call 9
    drop
    local.get 1
    call 6
    drop
    local.get 2
    call 6
    drop
    local.get 0
    call 6
    drop
    i32.const 1346
    i32.const 1356
    i32.const 1364
    call 10
    drop
    i32.const 1346
    i32.const 1391
    i32.const 1407
    call 10
    drop
    i32.const 1346
    i32.const 1356
    i32.const 1440
    call 11
    drop
    i32.const 1346
    i32.const 1391
    i32.const 1470
    call 11
    drop
    i32.const 1506
    call 0
    drop
    i32.const 1519
    call 4
    local.set 0
    i32.const 1524
    call 4
    local.set 1
    local.get 0
    call 12
    drop
    local.get 1
    call 12
    drop
    local.get 0
    call 6
    drop
    local.get 1
    call 6
    drop
    i32.const 1
    call 13
    local.tee 0
    call 12
    drop
    local.get 0
    call 6
    drop
    call 14
    local.tee 0
    i32.const 10
    call 16
    call 15
    drop
    local.get 0
    i64.const 666
    call 17
    call 15
    drop
    local.get 0
    f32.const 0x1.f147aep+2 (;=7.77;)
    call 18
    call 15
    drop
    local.get 0
    f64.const 0x1.9071c432ca57ap+7 (;=200.222;)
    call 19
    call 15
    drop
    local.get 0
    i32.const 1533
    call 4
    call 15
    drop
    local.get 0
    i32.const 1543
    call 20
    call 15
    drop
    i32.const 1261
    i32.const 1555
    local.get 0
    call 21
    drop
    local.get 0
    call 22
    drop
    i32.const 1261
    call 8
    i32.const 1593
    call 1
    local.tee 0
    call 12
    drop
    local.get 0
    i32.const 1598
    call 1
    local.tee 1
    call 12
    drop
    local.get 1
    call 6
    drop
    local.get 0
    call 6
    drop
    i32.const 0)
  (memory (;0;) 2)
  (global (;0;) i32 (i32.const 1024))
  (global (;1;) i32 (i32.const 1611))
  (global (;2;) i32 (i32.const 1024))
  (global (;3;) i32 (i32.const 67152))
  (global (;4;) i32 (i32.const 0))
  (global (;5;) i32 (i32.const 1))
  (export "memory" (memory 0))
  (export "__wasm_call_ctors" (func 23))
  (export "my_class_ReplaceMe_request" (func 24))
  (export "my_class_ReplaceMe_requestfromto" (func 25))
  (export "my_instance_ReplaceMe_request" (func 26))
  (export "my_instance_ReplaceMe_requestfromto" (func 27))
  (export "entry" (func 28))
  (export "__dso_handle" (global 0))
  (export "__data_end" (global 1))
  (export "__global_base" (global 2))
  (export "__heap_base" (global 3))
  (export "__memory_base" (global 4))
  (export "__table_base" (global 5))
  (data (;0;) (i32.const 1024) "replaced + ReplaceMe request\00replaced + ReplaceMe requestFrom:Two to:One\00replaced - ReplaceMe request\00wap_request\00replaced - ReplaceMe requestFrom:Two to:One\00UIApplication\00sharedApplication\00keyWindow\00UIColor\00redColor\00setBackgroundColor:\00CallMe\00sayHi\00I am from c program\00sayWord:\00How are you today\00I am happy\00sayYou:andMe:\00ReplaceMe\00request\00my_class_ReplaceMe_request\00requestFrom:to:\00my_class_ReplaceMe_requestfromto\00my_instance_ReplaceMe_request\00my_instance_ReplaceMe_requestfromto\00hello matrix\00good\00 morning\00excellent\00WebAssembly\00callWithManyArguments:p1:p2:p3:p4:p5:\00init\00returnString"))
