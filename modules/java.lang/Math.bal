import ballerina/jballerina.java;

# Ballerina class mapping for the Java `java.lang.Math` class.
@java:Binding {'class: "java.lang.Math"}
public distinct class Math {

    *java:JObject;
    *Object;

    # The `handle` field that stores the reference to the `java.lang.Math` object.
    public handle jObj;

    # The init function of the Ballerina class mapping the `java.lang.Math` Java class.
    #
    # + obj - The `handle` value containing the Java reference of the object.
    public function init(handle obj) {
        self.jObj = obj;
    }

    # The function to retrieve the string representation of the Ballerina class mapping the `java.lang.Math` Java class.
    #
    # + return - The `string` form of the Java object instance.
    public function toString() returns string {
        return java:toString(self.jObj) ?: "";
    }

    # The function that maps to the `equals` method of `java.lang.Math`.
    #
    # + arg0 - The `Object` value required to map with the Java method parameter.
    # + return - The `boolean` value returning from the Java mapping.
    public function 'equals(Object arg0) returns boolean {
        return java_lang_Math_equals(self.jObj, arg0.jObj);
    }

    # The function that maps to the `getClass` method of `java.lang.Math`.
    #
    # + return - The `Class` value returning from the Java mapping.
    public function getClass() returns Class {
        handle externalObj = java_lang_Math_getClass(self.jObj);
        Class newObj = new (externalObj);
        return newObj;
    }

    # The function that maps to the `hashCode` method of `java.lang.Math`.
    #
    # + return - The `int` value returning from the Java mapping.
    public function hashCode() returns int {
        return java_lang_Math_hashCode(self.jObj);
    }

    # The function that maps to the `notify` method of `java.lang.Math`.
    public function notify() {
        java_lang_Math_notify(self.jObj);
    }

    # The function that maps to the `notifyAll` method of `java.lang.Math`.
    public function notifyAll() {
        java_lang_Math_notifyAll(self.jObj);
    }

    # The function that maps to the `wait` method of `java.lang.Math`.
    #
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function 'wait() returns InterruptedException? {
        error|() externalObj = java_lang_Math_wait(self.jObj);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.lang.Math`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function wait2(int arg0) returns InterruptedException? {
        error|() externalObj = java_lang_Math_wait2(self.jObj, arg0);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

    # The function that maps to the `wait` method of `java.lang.Math`.
    #
    # + arg0 - The `int` value required to map with the Java method parameter.
    # + arg1 - The `int` value required to map with the Java method parameter.
    # + return - The `InterruptedException` value returning from the Java mapping.
    public function wait3(int arg0, int arg1) returns InterruptedException? {
        error|() externalObj = java_lang_Math_wait3(self.jObj, arg0, arg1);
        if (externalObj is error) {
            InterruptedException e = error InterruptedException(INTERRUPTEDEXCEPTION, externalObj, message = externalObj.message());
            return e;
        }
    }

}

# The function that maps to the `IEEEremainder` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_IEEEremainder(float arg0, float arg1) returns float {
    return java_lang_Math_IEEEremainder(arg0, arg1);
}

# The function that maps to the `abs` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_abs(float arg0) returns float {
    return java_lang_Math_abs(arg0);
}

# The function that maps to the `abs` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_abs2(float arg0) returns float {
    return java_lang_Math_abs2(arg0);
}

# The function that maps to the `abs` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_abs3(int arg0) returns int {
    return java_lang_Math_abs3(arg0);
}

# The function that maps to the `abs` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_abs4(int arg0) returns int {
    return java_lang_Math_abs4(arg0);
}

# The function that maps to the `absExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_absExact(int arg0) returns int {
    return java_lang_Math_absExact(arg0);
}

# The function that maps to the `absExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_absExact2(int arg0) returns int {
    return java_lang_Math_absExact2(arg0);
}

# The function that maps to the `acos` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_acos(float arg0) returns float {
    return java_lang_Math_acos(arg0);
}

# The function that maps to the `addExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_addExact(int arg0, int arg1) returns int {
    return java_lang_Math_addExact(arg0, arg1);
}

# The function that maps to the `addExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_addExact2(int arg0, int arg1) returns int {
    return java_lang_Math_addExact2(arg0, arg1);
}

# The function that maps to the `asin` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_asin(float arg0) returns float {
    return java_lang_Math_asin(arg0);
}

# The function that maps to the `atan` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_atan(float arg0) returns float {
    return java_lang_Math_atan(arg0);
}

# The function that maps to the `atan2` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_atan2(float arg0, float arg1) returns float {
    return java_lang_Math_atan2(arg0, arg1);
}

# The function that maps to the `cbrt` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_cbrt(float arg0) returns float {
    return java_lang_Math_cbrt(arg0);
}

# The function that maps to the `ceil` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_ceil(float arg0) returns float {
    return java_lang_Math_ceil(arg0);
}

# The function that maps to the `copySign` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_copySign(float arg0, float arg1) returns float {
    return java_lang_Math_copySign(arg0, arg1);
}

# The function that maps to the `copySign` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_copySign2(float arg0, float arg1) returns float {
    return java_lang_Math_copySign2(arg0, arg1);
}

# The function that maps to the `cos` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_cos(float arg0) returns float {
    return java_lang_Math_cos(arg0);
}

# The function that maps to the `cosh` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_cosh(float arg0) returns float {
    return java_lang_Math_cosh(arg0);
}

# The function that maps to the `decrementExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_decrementExact(int arg0) returns int {
    return java_lang_Math_decrementExact(arg0);
}

# The function that maps to the `decrementExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_decrementExact2(int arg0) returns int {
    return java_lang_Math_decrementExact2(arg0);
}

# The function that maps to the `exp` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_exp(float arg0) returns float {
    return java_lang_Math_exp(arg0);
}

# The function that maps to the `expm1` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_expm1(float arg0) returns float {
    return java_lang_Math_expm1(arg0);
}

# The function that maps to the `floor` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_floor(float arg0) returns float {
    return java_lang_Math_floor(arg0);
}

# The function that maps to the `floorDiv` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorDiv(int arg0, int arg1) returns int {
    return java_lang_Math_floorDiv(arg0, arg1);
}

# The function that maps to the `floorDiv` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorDiv2(int arg0, int arg1) returns int {
    return java_lang_Math_floorDiv2(arg0, arg1);
}

# The function that maps to the `floorDiv` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorDiv3(int arg0, int arg1) returns int {
    return java_lang_Math_floorDiv3(arg0, arg1);
}

# The function that maps to the `floorMod` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorMod(int arg0, int arg1) returns int {
    return java_lang_Math_floorMod(arg0, arg1);
}

# The function that maps to the `floorMod` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorMod2(int arg0, int arg1) returns int {
    return java_lang_Math_floorMod2(arg0, arg1);
}

# The function that maps to the `floorMod` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_floorMod3(int arg0, int arg1) returns int {
    return java_lang_Math_floorMod3(arg0, arg1);
}

# The function that maps to the `fma` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + arg2 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_fma(float arg0, float arg1, float arg2) returns float {
    return java_lang_Math_fma(arg0, arg1, arg2);
}

# The function that maps to the `fma` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + arg2 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_fma2(float arg0, float arg1, float arg2) returns float {
    return java_lang_Math_fma2(arg0, arg1, arg2);
}

# The function that maps to the `getExponent` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_getExponent(float arg0) returns int {
    return java_lang_Math_getExponent(arg0);
}

# The function that maps to the `getExponent` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_getExponent2(float arg0) returns int {
    return java_lang_Math_getExponent2(arg0);
}

# The function that maps to the `hypot` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_hypot(float arg0, float arg1) returns float {
    return java_lang_Math_hypot(arg0, arg1);
}

# The function that maps to the `incrementExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_incrementExact(int arg0) returns int {
    return java_lang_Math_incrementExact(arg0);
}

# The function that maps to the `incrementExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_incrementExact2(int arg0) returns int {
    return java_lang_Math_incrementExact2(arg0);
}

# The function that maps to the `log` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_log(float arg0) returns float {
    return java_lang_Math_log(arg0);
}

# The function that maps to the `log10` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_log10(float arg0) returns float {
    return java_lang_Math_log10(arg0);
}

# The function that maps to the `log1p` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_log1p(float arg0) returns float {
    return java_lang_Math_log1p(arg0);
}

# The function that maps to the `max` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_max(float arg0, float arg1) returns float {
    return java_lang_Math_max(arg0, arg1);
}

# The function that maps to the `max` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_max2(float arg0, float arg1) returns float {
    return java_lang_Math_max2(arg0, arg1);
}

# The function that maps to the `max` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_max3(int arg0, int arg1) returns int {
    return java_lang_Math_max3(arg0, arg1);
}

# The function that maps to the `max` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_max4(int arg0, int arg1) returns int {
    return java_lang_Math_max4(arg0, arg1);
}

# The function that maps to the `min` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_min(float arg0, float arg1) returns float {
    return java_lang_Math_min(arg0, arg1);
}

# The function that maps to the `min` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_min2(float arg0, float arg1) returns float {
    return java_lang_Math_min2(arg0, arg1);
}

# The function that maps to the `min` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_min3(int arg0, int arg1) returns int {
    return java_lang_Math_min3(arg0, arg1);
}

# The function that maps to the `min` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_min4(int arg0, int arg1) returns int {
    return java_lang_Math_min4(arg0, arg1);
}

# The function that maps to the `multiplyExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_multiplyExact(int arg0, int arg1) returns int {
    return java_lang_Math_multiplyExact(arg0, arg1);
}

# The function that maps to the `multiplyExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_multiplyExact2(int arg0, int arg1) returns int {
    return java_lang_Math_multiplyExact2(arg0, arg1);
}

# The function that maps to the `multiplyExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_multiplyExact3(int arg0, int arg1) returns int {
    return java_lang_Math_multiplyExact3(arg0, arg1);
}

# The function that maps to the `multiplyFull` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_multiplyFull(int arg0, int arg1) returns int {
    return java_lang_Math_multiplyFull(arg0, arg1);
}

# The function that maps to the `multiplyHigh` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_multiplyHigh(int arg0, int arg1) returns int {
    return java_lang_Math_multiplyHigh(arg0, arg1);
}

# The function that maps to the `negateExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_negateExact(int arg0) returns int {
    return java_lang_Math_negateExact(arg0);
}

# The function that maps to the `negateExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_negateExact2(int arg0) returns int {
    return java_lang_Math_negateExact2(arg0);
}

# The function that maps to the `nextAfter` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextAfter(float arg0, float arg1) returns float {
    return java_lang_Math_nextAfter(arg0, arg1);
}

# The function that maps to the `nextAfter` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextAfter2(float arg0, float arg1) returns float {
    return java_lang_Math_nextAfter2(arg0, arg1);
}

# The function that maps to the `nextDown` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextDown(float arg0) returns float {
    return java_lang_Math_nextDown(arg0);
}

# The function that maps to the `nextDown` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextDown2(float arg0) returns float {
    return java_lang_Math_nextDown2(arg0);
}

# The function that maps to the `nextUp` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextUp(float arg0) returns float {
    return java_lang_Math_nextUp(arg0);
}

# The function that maps to the `nextUp` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_nextUp2(float arg0) returns float {
    return java_lang_Math_nextUp2(arg0);
}

# The function that maps to the `pow` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_pow(float arg0, float arg1) returns float {
    return java_lang_Math_pow(arg0, arg1);
}

# The function that maps to the `random` method of `java.lang.Math`.
#
# + return - The `float` value returning from the Java mapping.
public function Math_random() returns float {
    return java_lang_Math_random();
}

# The function that maps to the `rint` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_rint(float arg0) returns float {
    return java_lang_Math_rint(arg0);
}

# The function that maps to the `round` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_round(float arg0) returns int {
    return java_lang_Math_round(arg0);
}

# The function that maps to the `round` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_round2(float arg0) returns int {
    return java_lang_Math_round2(arg0);
}

# The function that maps to the `scalb` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_scalb(float arg0, int arg1) returns float {
    return java_lang_Math_scalb(arg0, arg1);
}

# The function that maps to the `scalb` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_scalb2(float arg0, int arg1) returns float {
    return java_lang_Math_scalb2(arg0, arg1);
}

# The function that maps to the `signum` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_signum(float arg0) returns float {
    return java_lang_Math_signum(arg0);
}

# The function that maps to the `signum` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_signum2(float arg0) returns float {
    return java_lang_Math_signum2(arg0);
}

# The function that maps to the `sin` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_sin(float arg0) returns float {
    return java_lang_Math_sin(arg0);
}

# The function that maps to the `sinh` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_sinh(float arg0) returns float {
    return java_lang_Math_sinh(arg0);
}

# The function that maps to the `sqrt` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_sqrt(float arg0) returns float {
    return java_lang_Math_sqrt(arg0);
}

# The function that maps to the `subtractExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_subtractExact(int arg0, int arg1) returns int {
    return java_lang_Math_subtractExact(arg0, arg1);
}

# The function that maps to the `subtractExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + arg1 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_subtractExact2(int arg0, int arg1) returns int {
    return java_lang_Math_subtractExact2(arg0, arg1);
}

# The function that maps to the `tan` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_tan(float arg0) returns float {
    return java_lang_Math_tan(arg0);
}

# The function that maps to the `tanh` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_tanh(float arg0) returns float {
    return java_lang_Math_tanh(arg0);
}

# The function that maps to the `toDegrees` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_toDegrees(float arg0) returns float {
    return java_lang_Math_toDegrees(arg0);
}

# The function that maps to the `toIntExact` method of `java.lang.Math`.
#
# + arg0 - The `int` value required to map with the Java method parameter.
# + return - The `int` value returning from the Java mapping.
public function Math_toIntExact(int arg0) returns int {
    return java_lang_Math_toIntExact(arg0);
}

# The function that maps to the `toRadians` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_toRadians(float arg0) returns float {
    return java_lang_Math_toRadians(arg0);
}

# The function that maps to the `ulp` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_ulp(float arg0) returns float {
    return java_lang_Math_ulp(arg0);
}

# The function that maps to the `ulp` method of `java.lang.Math`.
#
# + arg0 - The `float` value required to map with the Java method parameter.
# + return - The `float` value returning from the Java mapping.
public function Math_ulp2(float arg0) returns float {
    return java_lang_Math_ulp2(arg0);
}

# The function that retrieves the value of the public field `E`.
#
# + return - The `float` value of the field.
public function Math_getE() returns float {
    return java_lang_Math_getE();
}

# The function that retrieves the value of the public field `PI`.
#
# + return - The `float` value of the field.
public function Math_getPI() returns float {
    return java_lang_Math_getPI();
}

function java_lang_Math_IEEEremainder(float arg0, float arg1) returns float = @java:Method {
    name: "IEEEremainder",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_abs(float arg0) returns float = @java:Method {
    name: "abs",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_abs2(float arg0) returns float = @java:Method {
    name: "abs",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_abs3(int arg0) returns int = @java:Method {
    name: "abs",
    'class: "java.lang.Math",
    paramTypes: ["int"]
} external;

function java_lang_Math_abs4(int arg0) returns int = @java:Method {
    name: "abs",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_absExact(int arg0) returns int = @java:Method {
    name: "absExact",
    'class: "java.lang.Math",
    paramTypes: ["int"]
} external;

function java_lang_Math_absExact2(int arg0) returns int = @java:Method {
    name: "absExact",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_acos(float arg0) returns float = @java:Method {
    name: "acos",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_addExact(int arg0, int arg1) returns int = @java:Method {
    name: "addExact",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_addExact2(int arg0, int arg1) returns int = @java:Method {
    name: "addExact",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_asin(float arg0) returns float = @java:Method {
    name: "asin",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_atan(float arg0) returns float = @java:Method {
    name: "atan",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_atan2(float arg0, float arg1) returns float = @java:Method {
    name: "atan2",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_cbrt(float arg0) returns float = @java:Method {
    name: "cbrt",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_ceil(float arg0) returns float = @java:Method {
    name: "ceil",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_copySign(float arg0, float arg1) returns float = @java:Method {
    name: "copySign",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_copySign2(float arg0, float arg1) returns float = @java:Method {
    name: "copySign",
    'class: "java.lang.Math",
    paramTypes: ["float", "float"]
} external;

function java_lang_Math_cos(float arg0) returns float = @java:Method {
    name: "cos",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_cosh(float arg0) returns float = @java:Method {
    name: "cosh",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_decrementExact(int arg0) returns int = @java:Method {
    name: "decrementExact",
    'class: "java.lang.Math",
    paramTypes: ["int"]
} external;

function java_lang_Math_decrementExact2(int arg0) returns int = @java:Method {
    name: "decrementExact",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_equals(handle receiver, handle arg0) returns boolean = @java:Method {
    name: "equals",
    'class: "java.lang.Math",
    paramTypes: ["java.lang.Object"]
} external;

function java_lang_Math_exp(float arg0) returns float = @java:Method {
    name: "exp",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_expm1(float arg0) returns float = @java:Method {
    name: "expm1",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_floor(float arg0) returns float = @java:Method {
    name: "floor",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_floorDiv(int arg0, int arg1) returns int = @java:Method {
    name: "floorDiv",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_floorDiv2(int arg0, int arg1) returns int = @java:Method {
    name: "floorDiv",
    'class: "java.lang.Math",
    paramTypes: ["long", "int"]
} external;

function java_lang_Math_floorDiv3(int arg0, int arg1) returns int = @java:Method {
    name: "floorDiv",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_floorMod(int arg0, int arg1) returns int = @java:Method {
    name: "floorMod",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_floorMod2(int arg0, int arg1) returns int = @java:Method {
    name: "floorMod",
    'class: "java.lang.Math",
    paramTypes: ["long", "int"]
} external;

function java_lang_Math_floorMod3(int arg0, int arg1) returns int = @java:Method {
    name: "floorMod",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_fma(float arg0, float arg1, float arg2) returns float = @java:Method {
    name: "fma",
    'class: "java.lang.Math",
    paramTypes: ["double", "double", "double"]
} external;

function java_lang_Math_fma2(float arg0, float arg1, float arg2) returns float = @java:Method {
    name: "fma",
    'class: "java.lang.Math",
    paramTypes: ["float", "float", "float"]
} external;

function java_lang_Math_getClass(handle receiver) returns handle = @java:Method {
    name: "getClass",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_getExponent(float arg0) returns int = @java:Method {
    name: "getExponent",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_getExponent2(float arg0) returns int = @java:Method {
    name: "getExponent",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_hashCode(handle receiver) returns int = @java:Method {
    name: "hashCode",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_hypot(float arg0, float arg1) returns float = @java:Method {
    name: "hypot",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_incrementExact(int arg0) returns int = @java:Method {
    name: "incrementExact",
    'class: "java.lang.Math",
    paramTypes: ["int"]
} external;

function java_lang_Math_incrementExact2(int arg0) returns int = @java:Method {
    name: "incrementExact",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_log(float arg0) returns float = @java:Method {
    name: "log",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_log10(float arg0) returns float = @java:Method {
    name: "log10",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_log1p(float arg0) returns float = @java:Method {
    name: "log1p",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_max(float arg0, float arg1) returns float = @java:Method {
    name: "max",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_max2(float arg0, float arg1) returns float = @java:Method {
    name: "max",
    'class: "java.lang.Math",
    paramTypes: ["float", "float"]
} external;

function java_lang_Math_max3(int arg0, int arg1) returns int = @java:Method {
    name: "max",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_max4(int arg0, int arg1) returns int = @java:Method {
    name: "max",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_min(float arg0, float arg1) returns float = @java:Method {
    name: "min",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_min2(float arg0, float arg1) returns float = @java:Method {
    name: "min",
    'class: "java.lang.Math",
    paramTypes: ["float", "float"]
} external;

function java_lang_Math_min3(int arg0, int arg1) returns int = @java:Method {
    name: "min",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_min4(int arg0, int arg1) returns int = @java:Method {
    name: "min",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_multiplyExact(int arg0, int arg1) returns int = @java:Method {
    name: "multiplyExact",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_multiplyExact2(int arg0, int arg1) returns int = @java:Method {
    name: "multiplyExact",
    'class: "java.lang.Math",
    paramTypes: ["long", "int"]
} external;

function java_lang_Math_multiplyExact3(int arg0, int arg1) returns int = @java:Method {
    name: "multiplyExact",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_multiplyFull(int arg0, int arg1) returns int = @java:Method {
    name: "multiplyFull",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_multiplyHigh(int arg0, int arg1) returns int = @java:Method {
    name: "multiplyHigh",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_negateExact(int arg0) returns int = @java:Method {
    name: "negateExact",
    'class: "java.lang.Math",
    paramTypes: ["int"]
} external;

function java_lang_Math_negateExact2(int arg0) returns int = @java:Method {
    name: "negateExact",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_nextAfter(float arg0, float arg1) returns float = @java:Method {
    name: "nextAfter",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_nextAfter2(float arg0, float arg1) returns float = @java:Method {
    name: "nextAfter",
    'class: "java.lang.Math",
    paramTypes: ["float", "double"]
} external;

function java_lang_Math_nextDown(float arg0) returns float = @java:Method {
    name: "nextDown",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_nextDown2(float arg0) returns float = @java:Method {
    name: "nextDown",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_nextUp(float arg0) returns float = @java:Method {
    name: "nextUp",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_nextUp2(float arg0) returns float = @java:Method {
    name: "nextUp",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_notify(handle receiver) = @java:Method {
    name: "notify",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_notifyAll(handle receiver) = @java:Method {
    name: "notifyAll",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_pow(float arg0, float arg1) returns float = @java:Method {
    name: "pow",
    'class: "java.lang.Math",
    paramTypes: ["double", "double"]
} external;

function java_lang_Math_random() returns float = @java:Method {
    name: "random",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_rint(float arg0) returns float = @java:Method {
    name: "rint",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_round(float arg0) returns int = @java:Method {
    name: "round",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_round2(float arg0) returns int = @java:Method {
    name: "round",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_scalb(float arg0, int arg1) returns float = @java:Method {
    name: "scalb",
    'class: "java.lang.Math",
    paramTypes: ["double", "int"]
} external;

function java_lang_Math_scalb2(float arg0, int arg1) returns float = @java:Method {
    name: "scalb",
    'class: "java.lang.Math",
    paramTypes: ["float", "int"]
} external;

function java_lang_Math_signum(float arg0) returns float = @java:Method {
    name: "signum",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_signum2(float arg0) returns float = @java:Method {
    name: "signum",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_sin(float arg0) returns float = @java:Method {
    name: "sin",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_sinh(float arg0) returns float = @java:Method {
    name: "sinh",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_sqrt(float arg0) returns float = @java:Method {
    name: "sqrt",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_subtractExact(int arg0, int arg1) returns int = @java:Method {
    name: "subtractExact",
    'class: "java.lang.Math",
    paramTypes: ["int", "int"]
} external;

function java_lang_Math_subtractExact2(int arg0, int arg1) returns int = @java:Method {
    name: "subtractExact",
    'class: "java.lang.Math",
    paramTypes: ["long", "long"]
} external;

function java_lang_Math_tan(float arg0) returns float = @java:Method {
    name: "tan",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_tanh(float arg0) returns float = @java:Method {
    name: "tanh",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_toDegrees(float arg0) returns float = @java:Method {
    name: "toDegrees",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_toIntExact(int arg0) returns int = @java:Method {
    name: "toIntExact",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_toRadians(float arg0) returns float = @java:Method {
    name: "toRadians",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_ulp(float arg0) returns float = @java:Method {
    name: "ulp",
    'class: "java.lang.Math",
    paramTypes: ["double"]
} external;

function java_lang_Math_ulp2(float arg0) returns float = @java:Method {
    name: "ulp",
    'class: "java.lang.Math",
    paramTypes: ["float"]
} external;

function java_lang_Math_wait(handle receiver) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Math",
    paramTypes: []
} external;

function java_lang_Math_wait2(handle receiver, int arg0) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Math",
    paramTypes: ["long"]
} external;

function java_lang_Math_wait3(handle receiver, int arg0, int arg1) returns error? = @java:Method {
    name: "wait",
    'class: "java.lang.Math",
    paramTypes: ["long", "int"]
} external;

function java_lang_Math_getE() returns float = @java:FieldGet {
    name: "E",
    'class: "java.lang.Math"
} external;

function java_lang_Math_getPI() returns float = @java:FieldGet {
    name: "PI",
    'class: "java.lang.Math"
} external;

