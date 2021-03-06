//
//  wap_objc_export_basic.h
//  WasmPatch
//
//  Created by everettjf on 2020/4/6.
//  Copyright © 2020 everettjf. All rights reserved.
//

#ifndef wap_objc_export_basic_h
#define wap_objc_export_basic_h

#include "../wap_objc_define.h"
#include "wap_objc_export_array.h"
#include "wap_objc_export_helper.h"
#include <ffi.h>

WAPObject alloc_objc_class(WAPClassName class_name) {
    Class cls = objc_getClass(class_name);
    id val = [cls alloc];
    return WAPCreateObjectFromObjcValue("objc", val);
}

WAPObject alloc_int32(int32_t v) { return WAPCreateObjectFromPlainValue("int32", @(v)); }
WAPObject alloc_int64(int64_t v) { return WAPCreateObjectFromPlainValue("int64", @(v)); }
WAPObject alloc_float(float v) { return WAPCreateObjectFromPlainValue("float", @(v)); }
WAPObject alloc_double(double v) { return WAPCreateObjectFromPlainValue("double", @(v)); }

WAPObject alloc_string(const char* v) {
    NSString * str = [NSString stringWithUTF8String:v];
    return WAPCreateObjectFromPlainValue("string", str);
}
WAPResultVoid print_object(WAPObject a) {
    if (a == 0) {
        return 1;
    }
    WAPInternalObject *obj = GetInternalObject(a);
    if (obj->cate == 'p') {
        NSLog(@"plain: %@",obj->value);
    } else if (obj->cate == 'o') {
        NSLog(@"objc: %@",obj->value);
    } else if (obj->cate == 'v') {
        NSLog(@"Void");
    } else {
        NSLog(@"Unknown object category : %@" , obj->value);
    }
    return 0;
}

WAPResultVoid print_string(const char *str) {
    NSLog(@"%s",(str?:"NULL"));
    return 0;
}

WAPResultVoid dealloc_object(WAPObject a) {
    if (a == 0) {
        return 1;
    }
    WAPInternalObject *obj = GetInternalObject(a);
    delete obj;
    return 0;
}


__WAP_EXPORT_FUNCTION(alloc_objc_class_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArgMem  (WAPClassName, class_name)
    WAPObject result = alloc_objc_class(class_name);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(alloc_int32_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArg  (int32_t, v)
    WAPObject result = alloc_int32(v);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(alloc_int64_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArg  (int64_t, v)
    WAPObject result = alloc_int64(v);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(alloc_float_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArg  (float, v)
    WAPObject result = alloc_float(v);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(alloc_double_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArg  (double, v)
    WAPObject result = alloc_double(v);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(alloc_string_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArgMem  (const char*, v)
    WAPObject result = alloc_string(v);
    m3ApiReturn (result)
}


__WAP_EXPORT_FUNCTION(print_object_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArg  (WAPObject, addr)
    WAPResultVoid result = print_object(addr);
    m3ApiReturn (result)
}


__WAP_EXPORT_FUNCTION(print_string_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArgMem  (const char*, v);
    WAPResultVoid result = print_string(v);
    m3ApiReturn (result)
}

__WAP_EXPORT_FUNCTION(dealloc_object_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArg  (WAPObject, addr)
    WAPResultVoid result = dealloc_object(addr);
    m3ApiReturn (result)
}

// added by zhiyangfu

WAPResultVoid objc_nslog(WAPArray array) {
    int size = get_array_size(array);
    
    void (*functionPtr)(void)  = (void (*)(void))&NSLog;
    int argCount = size;
    
    //参数类型数组
    ffi_type **ffiArgTypes = (ffi_type **)alloca(sizeof(ffi_type *) *argCount);
    //参数数据数组
    void **ffiArgs = (void **)alloca(sizeof(void *) *argCount);
    for (int i = 0; i < size; ++i) {
        WAPObject item = get_array_item(array, i);
        WAPInternalObject *internalItem = GetInternalObject(item);
        if (internalItem->cate == 'p') {
            if (internalItem->type == "int32") {
                ffiArgTypes[i] = &ffi_type_uint32;
            } else if (internalItem->type == "int64") {
                ffiArgTypes[i] = &ffi_type_uint64;
            } else if (internalItem->type == "double") {
                ffiArgTypes[i] = &ffi_type_double;
            } else if (internalItem->type == "float") {
                ffiArgTypes[i] = &ffi_type_float;
            } else if (internalItem->type == "string") {
                ffiArgTypes[i] = &ffi_type_pointer;
            }
        } else if (internalItem->cate == 'o') {
            ffiArgTypes[i] = &ffi_type_pointer;
        }
        
        void *ffiArgPtr = alloca(ffiArgTypes[i]->size);
        if (internalItem->cate == 'p') {
            if (internalItem->type == "int32") {
                int32_t *argPtr = (int32_t *)ffiArgPtr;
                *argPtr = [internalItem->value intValue];
            } else if (internalItem->type == "int64") {
                int64_t *argPtr = (int64_t *)ffiArgPtr;
                *argPtr = [internalItem->value integerValue];
            } else if (internalItem->type == "double") {
                double *argPtr = (double *)ffiArgPtr;
                *argPtr = [internalItem->value doubleValue];
            } else if (internalItem->type == "float") {
                float *argPtr = (float *)ffiArgPtr;
                *argPtr = [internalItem->value doubleValue];
            } else if (internalItem->type == "string") {
                id __autoreleasing *argPtr = (id __autoreleasing *)ffiArgPtr;
                *argPtr = internalItem->value;
            }
        } else if (internalItem->cate == 'o') {
            id __autoreleasing *argPtr = (id __autoreleasing *)ffiArgPtr;
            *argPtr = internalItem->value;
        }
        ffiArgs[i] = ffiArgPtr;
    }
    
    //生成函数原型 ffi_cfi 对象
    ffi_cif cif;
    ffi_type *returnFfiType = &ffi_type_void;
    ffi_status ffiPrepStatus = ffi_prep_cif(&cif, FFI_DEFAULT_ABI, (unsigned int)argCount, returnFfiType, ffiArgTypes);
    
    if (ffiPrepStatus == FFI_OK) {
#ifdef __arm64__
        // 限制函数在寄存器上的参数个数为1
        // void NSLog(NSString *format, ...) 第一个参数为指针，其他参数全在栈上
        cif.aarch64_nfixedargs = 1;
#endif
        //根据cif函数原型，函数指针，返回值内存指针，函数参数数据调用这个函数
        ffi_call(&cif, functionPtr, NULL, ffiArgs);
    }
    
    return 0;
}

__WAP_EXPORT_FUNCTION(objc_nslog_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArg  (WAPArray, array)
    WAPResultVoid result = objc_nslog(array);
    m3ApiReturn (result);
}

WAPObject objc_allocate_class_pair(WAPClassName sub_class_name, WAPClassName base_class_name) {
    Class baseClass = objc_getClass(base_class_name);
    Class subClass = objc_getClass(sub_class_name);
    if (!subClass) {
        subClass = objc_allocateClassPair(baseClass, sub_class_name, 0);
    }
    
    return WAPCreateObjectFromObjcValue("objc", subClass);
}

__WAP_EXPORT_FUNCTION(objc_allocate_class_pair_raw) {
    m3ApiReturnType (WAPObject)
    m3ApiGetArgMem  (WAPClassName, sub_class_name)
    m3ApiGetArgMem  (WAPClassName, base_class_name)
    WAPObject result = objc_allocate_class_pair(sub_class_name, base_class_name);
    m3ApiReturn (result)
}

WAPResultVoid objc_register_class_pair(WAPObject cls) {
    WAPInternalObject *obj = GetInternalObject(cls);
    objc_registerClassPair(obj->value);
    return 0;
}

__WAP_EXPORT_FUNCTION(objc_register_class_pair_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArg  (WAPObject, cls)
    WAPResultVoid result = objc_register_class_pair(cls);
    m3ApiReturn (result)
}

//type定义参考:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
// property type: https://www.cnblogs.com/yanyan1119/p/5316315.html

WAPResultVoid objc_class_add_ivar(Class cls, WAPIVarName ivar_name, WAPEncodingName encoding) {
    NSUInteger size;
    NSUInteger alignment;
    NSGetSizeAndAlignment(encoding, &size, &alignment);
    class_addIvar(cls, ivar_name, size, alignment, encoding);
    
    return 0;
}

id add_getter(id self, SEL _cmd) {
    NSString *key = NSStringFromSelector(_cmd);
    NSString *varName = [NSString stringWithFormat:@"_%@", key];
    Ivar ivar = class_getInstanceVariable([self class], [varName UTF8String]);
    return object_getIvar(self, ivar);
}
 
void add_setter(id self, SEL _cmd, id newValue) {
    //移除set
    NSString *key = [NSStringFromSelector(_cmd) stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
    //首字母小写
    NSString *head = [key substringWithRange:NSMakeRange(0, 1)];
    head = [head lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:head];
    //移除后缀 ":"
    key = [key stringByReplacingCharactersInRange:NSMakeRange(key.length - 1, 1) withString:@""];
    
    NSString *varName = [NSString stringWithFormat:@"_%@", key];
    Ivar ivar = class_getInstanceVariable([self class], [varName UTF8String]);
    id oldValue = object_getIvar(self, ivar);
    if (oldValue != newValue) {
        object_setIvar(self, ivar, newValue);
    }
}

WAPResultVoid objc_class_add_property(WAPObject clazz, WAPPropertyName property_name, WAPObject attributes_addr)
{
    WAPInternalObject *obj = GetInternalObject(clazz);
    Class cls = obj->value;
    
    //先判断有没有这个属性，没有就添加，有就直接赋值
    Ivar ivar = class_getInstanceVariable(cls, property_name);
    if (ivar) {
        return 0;
    }
    
    /*
     objc_property_attribute_t type = { "T", "@\"NSString\"" };
     objc_property_attribute_t ownership = { "C", "" }; // C = copy
     objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
     objc_property_attribute_t backingivar  = { "V", "_privateName" };
     objc_property_attribute_t attrs[] = { type, ownership, backingivar };
     class_addProperty([SomeClass class], "name", attrs, 3);
     */
    WAPInternalArray *attributes = GetInternalArray(attributes_addr);
    unsigned int attributesCount = (unsigned int)(attributes ? attributes->items.size() / 2 : 0);
    objc_property_attribute_t *attrs = new objc_property_attribute_t[attributesCount];
    WAPIVarName ivarName;
    WAPEncodingName encodingName;
    for (unsigned int i = 0; i < attributesCount; ++i) {
        auto inputParamAddr = attributes->items[i * 2];
        WAPInternalObject *inputParam = GetInternalObject(inputParamAddr);
        NSString *string = (NSString *)inputParam->value;
        attrs[i].name = [string UTF8String];
        
        auto inputParamAddr1 = attributes->items[(i * 2) + 1];
        WAPInternalObject *inputParam1 = GetInternalObject(inputParamAddr1);
        NSString *string1 = (NSString *)inputParam1->value;
        attrs[i].value = [string1 UTF8String];
        
        if ([string isEqualToString:@"V"]) {
            ivarName = attrs[i].value;
        }
        else if ([string isEqualToString:@"T"]) {
            if (string1.length == 1) {
                encodingName = attrs[i].value;
            }
            else {
                // TODO: 各种 encoding
                encodingName = "@";
            }
        }
    }

    if (!class_addProperty(cls, property_name, attrs, attributesCount)) {
        class_replaceProperty(cls, property_name, attrs, attributesCount);
    }
    
    objc_class_add_ivar(cls, ivarName, encodingName);
    
    //添加get和set方法
    NSString *name = [[NSString alloc] initWithUTF8String:property_name];
    class_addMethod(cls, NSSelectorFromString(name), (IMP)add_getter, "@@:");
    class_addMethod(cls, NSSelectorFromString([NSString stringWithFormat:@"set%@:", [name capitalizedString]]), (IMP)add_setter, "v@:@");
    
    return 0;
}

__WAP_EXPORT_FUNCTION(objc_class_add_property_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArg  (WAPObject, clazz)
    m3ApiGetArgMem  (WAPPropertyName, property_name)
    m3ApiGetArg  (WAPObject, attributes_addr)
    WAPResultVoid result = objc_class_add_property(clazz, property_name, attributes_addr);
    m3ApiReturn (result)
}

id append_getter(id self, SEL _cmd) {
    NSString *key = NSStringFromSelector(_cmd);
    id value = objc_getAssociatedObject(self, NSSelectorFromString(key));
    return value;
}
 
void append_setter(id self, SEL _cmd, id newValue) {
    //移除set
    NSString *key = [NSStringFromSelector(_cmd) stringByReplacingCharactersInRange:NSMakeRange(0, 3) withString:@""];
    //首字母小写
    NSString *head = [key substringWithRange:NSMakeRange(0, 1)];
    head = [head lowercaseString];
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:head];
    //移除后缀 ":"
    key = [key stringByReplacingCharactersInRange:NSMakeRange(key.length - 1, 1) withString:@""];
    
    // TODO: 各种 policy
    objc_setAssociatedObject(self, NSSelectorFromString(key), newValue, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

WAPResultVoid objc_class_append_property(WAPClassName class_name, WAPPropertyName property_name, WAPObject attributes_addr)
{
    Class cls = objc_getClass(class_name);
    
    //先判断有没有这个属性，没有就添加，有就直接赋值
    Ivar ivar = class_getInstanceVariable(cls, property_name);
    if (ivar) {
        return 0;
    }
    
    /*
     objc_property_attribute_t type = { "T", "@\"NSString\"" };
     objc_property_attribute_t ownership = { "C", "" }; // C = copy
     objc_property_attribute_t ownership = { "N", "" }; //N = nonatomic
     objc_property_attribute_t backingivar  = { "V", "_privateName" };
     objc_property_attribute_t attrs[] = { type, ownership, backingivar };
     class_addProperty([SomeClass class], "name", attrs, 3);
     */
    WAPInternalArray *attributes = GetInternalArray(attributes_addr);
    unsigned int attributesCount = (unsigned int)(attributes ? attributes->items.size() / 2 : 0);
    objc_property_attribute_t *attrs = new objc_property_attribute_t[attributesCount];
    for (unsigned int i = 0; i < attributesCount; ++i) {
        auto inputParamAddr = attributes->items[i * 2];
        WAPInternalObject *inputParam = GetInternalObject(inputParamAddr);
        NSString *string = (NSString *)inputParam->value;
        attrs[i].name = [string UTF8String];
        
        auto inputParamAddr1 = attributes->items[(i * 2) + 1];
        WAPInternalObject *inputParam1 = GetInternalObject(inputParamAddr1);
        NSString *string1 = (NSString *)inputParam1->value;
        attrs[i].value = [string1 UTF8String];
    }

    if (!class_addProperty(cls, property_name, attrs, attributesCount)) {
        class_replaceProperty(cls, property_name, attrs, attributesCount);
    }
    
    //添加get和set方法
    NSString *name = [[NSString alloc] initWithUTF8String:property_name];
    class_addMethod(cls, NSSelectorFromString(name), (IMP)append_getter, "@@:");
    class_addMethod(cls, NSSelectorFromString([NSString stringWithFormat:@"set%@:", [name capitalizedString]]), (IMP)append_setter, "v@:@");
    
    return 0;
}

__WAP_EXPORT_FUNCTION(objc_class_append_property_raw) {
    m3ApiReturnType (WAPResultVoid)
    m3ApiGetArgMem  (WAPClassName, class_name)
    m3ApiGetArgMem  (WAPPropertyName, property_name)
    m3ApiGetArg  (WAPObject, attributes_addr)
    WAPResultVoid result = objc_class_append_property(class_name, property_name, attributes_addr);
    m3ApiReturn (result)
}

//1.type定义参考:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjCRuntimeGuide/Articles/ocrtTypeEncodings.html
// 2."v@:@",解释v-返回值void类型,@-self指针id类型,:-SEL指针SEL类型,@-函数第一个参数为id类型
// 3."@@:",解释@-返回值id类型,@-self指针id类型,:-SEL指针SEL类型,
//WAPResultVoid objc_class_add_method(WAPClassName class_name, WAPSelectorName selector_name, WAPSelectorName imp, WAPEncodingName encoding) {
//    Class cls = objc_getClass(class_name);
//    class_addMethod(cls, @selector(selector_name), (IMP)setExpressionFormula, encoding);
//
//    return 0;
//}

#endif /* wap_objc_export_basic_h */
