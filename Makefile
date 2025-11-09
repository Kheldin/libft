NAME = libft.a

CFLAGS = -Wall -Wextra -Werror

CC = cc

SRCFILES = ft_fds.c ft_alloc.c ft_is.c ft_itoa.c ft_split.c ft_str.c ft_str2.c ft_str3.c ft_strtrim.c ft_utils.c ft_mem.c

BONUSSRC = ft_lstnew_bonus.c ft_lstfree_bonus.c

OBJECTS = $(SRCFILES:.c=.o)

BONUSOBJS = $(BONUSSRC:.c=.o)

HEADER = libft.h

all : $(NAME)

$(NAME) : $(OBJECTS)
	ar rcs $(NAME) $(OBJECTS)

%.o: %.c $(HEADER)
	$(CC) $(CFLAGS) -c $< -o $@

bonus : .bonus

.bonus : $(OBJECTS) $(BONUSOBJS)
	ar rcs $(NAME) $(OBJECTS) $(BONUSOBJS)
	@touch .bonus

clean:
	rm -f $(OBJECTS)
	rm -f $(BONUSOBJS)
	rm -f .bonus

fclean: clean
	rm -f $(NAME)
	rm -f fds
	rm -f *.out

re: fclean all

.PHONY: all bonus clean fclean re