(;
  Pure fibonacci algorithm implementation in WAT. 
  TODO: test this shit :)
;)
(module
  ;; 
  (type $t0 (func (param i32 i32)))
  (func $fibonacci (export "fibonacci") (type $t0) (param $p0 i32) (param $p1 i32)
    (local $l0 i64) 
    (local $l1 i64) 
    (local $l2 i64) 
    (local $l3 i64) 
    (local $l4 i64)
    (block $B0
      (block $B1
        get_local $p1
        i32.eqz
        br_if $B1
        ;; a = 0
        i64.const 0
        set_local $l0
        ;; b = 1
        i64.const 1
        set_local $l1
        ;; index for loop
        i64.const 0
        set_local $l2

        i64.const 0
        set_local $l3
        ;; start looping
        ;; thanks to some random website for the loop logic :D
        (loop $L2
          (;
            1. Set c = a + b
            2. Assign a to b
            3. Assign b to c
          ;)
          get_local $l0
          tee_local $l4
          get_local $l3
          i64.add
          get_local $l1
          tee_local $l3
          get_local $l2
          i64.add
          tee_local $l1
          get_local $l3
          i64.lt_u
          i64.extend_u/i32
          i64.add
          set_local $l0
          get_local $l3
          set_local $l2
          get_local $l4
          set_local $l3
          get_local $p1
          i32.const -1
          i32.add
          tee_local $p1
          br_if $L2
          br $B0
        )
      )
      i64.const 0
      set_local $l0
      i64.const 1
      set_local $l1
    )
    get_local $p0
    get_local $l1
    i64.store
    get_local $p0
    get_local $l0
    i64.store offset=8)
  ;; general mem stuff down below;
  (table $T0 1 1 anyfunc)
  (memory $memory (export "memory") 17))
