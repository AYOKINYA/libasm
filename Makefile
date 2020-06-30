ASM = nasm

ASMFLAGS = -f macho64

OBJECTS = ft_write.o ft_strlen.o ft_strcpy.o ft_strcmp.o ft_strdup.o

NAME = libasm.a
TEST_BINARY = test
TEST_FILES = main.c
TEST_CC = gcc
TEST_CFLAGS = -Wall -Wextra -Werror

.PHONY: all re clean fclean bonus

%.o: %.s
	$(ASM) $(ASMFLAGS) -o $@ $<

$(NAME): $(OBJECTS)
	ar rc $(NAME) $(OBJECTS)

all: $(NAME)

$(TEST_BINARY): $(TEST_FILES)
	$(TEST_CC) $(TEST_CFLAGS) $(TEST_FILES) $(NAME) -o $(TEST_BINARY)

clean:
	rm -f $(OBJECTS)

fclean: clean
	rm -f $(NAME)

re: fclean all