
CC=gcc
SANFLAGS=-fsanitize=address -fno-omit-frame-pointer
CFLAGS=-g ${SANFLAGS}

all:
	${CC} ${CFLAGS} -o heap_ovf_test heap_ovf_test.c
	${CC} ${CFLAGS} -o stack_ovf_test stack_ovf_test.c
	${CC} ${CFLAGS} -o dangling_pointer_test dangling_pointer_test.c
	${CC} ${CFLAGS} -o use_after_return use_after_return.c

test:all
	-exec ./heap_ovf_test  ## - ignore errors to continue run
	-exec ./stack_ovf_test
	-exec ./dangling_pointer_test
	-exec ASAN_OPTIONS=detect_stack_use_after_return=1 ./use_after_return

clean:
	rm -f heap_ovf_test stack_ovf_test dangling_pointer_test use_after_return
