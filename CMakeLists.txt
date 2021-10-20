cmake_minimum_required(VERSION 3.10)

#
project(MemorySanti)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fsanitize=address -fno-omit-frame-pointer -g")

add_executable(heap_ovf_test  heap_ovf_test.c)
add_executable(stack_ovf_test  stack_ovf_test.c)
add_executable(dangling_pointer_test  dangling_pointer_test.c)
add_executable(use_after_return  use_after_return.c)

add_custom_command(
  TARGET heap_ovf_test
  POST_BUILD
  COMMAND -exec ${CMAKE_CURRENT_BINARY_DIR}/heap_ovf_test
  COMMENT "run heap_ovf_test ..."
  )

add_custom_command(
  TARGET stack_ovf_test
  POST_BUILD
  COMMAND -exec ${CMAKE_CURRENT_BINARY_DIR}/stack_ovf_test
  COMMENT "run stack_ovf_test ..."
  )

add_custom_command(
  TARGET dangling_pointer_test
  POST_BUILD
  COMMAND -exec ${CMAKE_CURRENT_BINARY_DIR}/dangling_pointer_test
  COMMENT "run dangling_pointer_test ..."
  )

add_custom_command(
  TARGET use_after_return
  POST_BUILD
  COMMAND -exec ASAN_OPTIONS=detect_stack_use_after_return=1 ${CMAKE_CURRENT_BINARY_DIR}/use_after_return
  COMMENT "run use_after_return ..."
  )
