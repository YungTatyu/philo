NAME = philo
CC = cc
CFLAGS = -Wall -Werror -Wextra
CFLAGS += -g -fsanitize=address

INCLUDES_DIR = include
INCLUDES =  -I$(INCLUDES_DIR)

SRCS_DIR = src
SRC = main.c

SRCS = $(addprefix $(SRCS_DIR)/, $(SRC));

OBJS_DIR = obj
OBJS = $(patsubst $(SRCS_DIR)/%.c,$(OBJS_DIR)/%.o,$(SRCS))

RM = rm -rf

all: $(NAME)

$(NAME):	$(OBJS)
	$(CC) $(CFLAGS) $(MINILIBX_FLAGS) $(INCLUDES) $(LIBFT_FLAGS) -o $@ $^

$(OBJS_DIR)/%.o: $(SRCS_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) $(OBJS_DIR)

fclean:	clean
	$(RM) $(NAME)

re: fclean all

debug: fclean
	make WITH_DEBUG=1

.PHONY: all fclean clean re debug test