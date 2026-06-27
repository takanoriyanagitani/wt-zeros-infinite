(module

  (import "wasi_snapshot_preview1" "proc_exit" (func $proc_exit (param i32)))

  (import "wasi_snapshot_preview1" "fd_write"
    (func $fd_write (param i32 i32 i32 i32) (result i32)))

  (global $STDIN i32 (i32.const 0))
  (global $STDOUT i32 (i32.const 1))
  (global $STDERR i32 (i32.const 2))

  (global $FD_WRIT_IOVEC_PTR i32 (i32.const 0x0001_0000))
  ;; assuming this page is filled by zeros
  (global $FD_WRIT_IOBUF_PTR i32 (i32.const 0x0002_0000))
  (global $FD_WRIT_BWRIT_PTR i32 (i32.const 0x0003_0000))

  (memory (export "memory") 4)

  (func $main (export "_start")
    (local $ret i32)

    ;; init the iovec

    global.get $FD_WRIT_IOVEC_PTR global.get $FD_WRIT_IOBUF_PTR i32.store
    global.get $FD_WRIT_IOVEC_PTR i32.const 65536 i32.store offset=4

    loop
      global.get $STDOUT
      global.get $FD_WRIT_IOVEC_PTR
      i32.const 1 ;; one buf
      global.get $FD_WRIT_BWRIT_PTR
      call $fd_write
      local.tee $ret i32.const 0 i32.ne if
        local.get $ret call $proc_exit
        unreachable
      end

      global.get $FD_WRIT_BWRIT_PTR i32.load
      i32.const 65536 i32.ne if
        i32.const 1 call $proc_exit
        unreachable
      end

      br 0
    end
  )

)
