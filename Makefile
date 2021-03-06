ASM = nasm

ASMFLAGS = -f macho64

OBJECTS = ft_write.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_read.o ft_strdup.o

NAME = libasm.a
TEST_BINARY = test
TEST_FILES = main.c
TEST_CC = gcc
TEST_CFLAGS = -Wall -Wextra -Werror

.PHONY: all re clean fclean bonus

%.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJECTS) $(TEST_FILES)
	ar rc $(NAME) $(OBJECTS)
	$(TEST_CC) $(TEST_CFLAGS) $(TEST_FILES) $(NAME) -o $(TEST_BINARY)

all: $(NAME)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)
	rm -f $(TEST_BINARY)

re: fclean all