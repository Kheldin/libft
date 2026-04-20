# libft

> A hand-crafted C standard library. 40+ functions reimplemented from scratch, covering string manipulation, memory management, character classification, I/O, and linked lists. The foundation of every subsequent 42 project.

---

## Overview

`libft` is the first project of the 42 curriculum. The goal is to reimplement a subset of the C standard library functions, understanding them deeply rather than just using them as black boxes and to build a personal utility library that will be reused and extended throughout the entire curriculum.

Every function is written in C, without relying on any standard library functions except where explicitly permitted (`malloc`, `free`, `write`). The library is compiled into a static archive `libft.a` using `ar`.

---

## Function Reference

### Part 1 — Libc Reimplementations

These functions replicate their standard libc counterparts exactly, prefixed with `ft_`.

**Character classification** (`ft_is.c`)

| Function | Description |
|----------|-------------|
| `ft_isalpha` | Returns 1 if the character is alphabetic |
| `ft_isdigit` | Returns 1 if the character is a digit |
| `ft_isalnum` | Returns 1 if the character is alphanumeric |
| `ft_isascii` | Returns 1 if the character is in the ASCII table |
| `ft_isprint` | Returns 1 if the character is printable |
| `ft_toupper` | Converts a lowercase letter to uppercase |
| `ft_tolower` | Converts an uppercase letter to lowercase |

**String functions** (`ft_str.c`, `ft_str2.c`, `ft_str3.c`)

| Function | Description |
|----------|-------------|
| `ft_strlen` | Returns the length of a string |
| `ft_strlcpy` | Copies a string with size-bounded truncation |
| `ft_strlcat` | Concatenates a string with size-bounded truncation |
| `ft_strchr` | Locates the first occurrence of a character in a string |
| `ft_strrchr` | Locates the last occurrence of a character in a string |
| `ft_strncmp` | Compares two strings up to n characters |
| `ft_strnstr` | Locates a substring in a string, within n characters |

**Memory functions** (`ft_mem.c`)

| Function | Description |
|----------|-------------|
| `ft_memset` | Fills a block of memory with a constant byte |
| `ft_bzero` | Zeroes a block of memory |
| `ft_memcpy` | Copies a block of memory |
| `ft_memmove` | Copies a block of memory, handling overlaps safely |
| `ft_memchr` | Scans memory for a byte |
| `ft_memcmp` | Compares two memory blocks |

**Conversion & allocation** (`ft_alloc.c`, `ft_itoa.c`)

| Function | Description |
|----------|-------------|
| `ft_atoi` | Converts a string to an integer |
| `ft_itoa` | Converts an integer to a string |
| `ft_calloc` | Allocates and zeroes memory |
| `ft_strdup` | Duplicates a string with `malloc` |

---

### Part 2 — Additional Functions

Functions not present in libc, or reimplemented with a different interface.

| Function | Description |
|----------|-------------|
| `ft_substr` | Returns a substring from a string |
| `ft_strjoin` | Concatenates two strings into a new one |
| `ft_strtrim` | Trims characters from both ends of a string (`ft_strtrim.c`) |
| `ft_split` | Splits a string by a delimiter into a NULL-terminated array (`ft_split.c`) |
| `ft_strmapi` | Applies a function to each character, creating a new string |
| `ft_striteri` | Applies a function to each character in place |
| `ft_putchar_fd` | Outputs a character to a file descriptor |
| `ft_putstr_fd` | Outputs a string to a file descriptor |
| `ft_putendl_fd` | Outputs a string followed by a newline to a file descriptor |
| `ft_putnbr_fd` | Outputs an integer to a file descriptor |

All fd-based output functions use only `write` — no formatted output from the standard library.

---

### Part 3 — Linked List (Bonus)

A singly linked list implementation using the `t_list` structure:

```c
typedef struct s_list
{
    void            *content;
    struct s_list   *next;
}   t_list;
```

| Function | Description |
|----------|-------------|
| `ft_lstnew` | Creates a new list node (`ft_lstnew_bonus.c`) |
| `ft_lstadd_front` | Adds a node at the front of the list |
| `ft_lstsize` | Returns the number of nodes in the list |
| `ft_lstlast` | Returns the last node |
| `ft_lstadd_back` | Adds a node at the end of the list |
| `ft_lstdelone` | Frees one node using a custom delete function |
| `ft_lstclear` | Frees all nodes and sets the pointer to NULL (`ft_lstfree_bonus.c`) |
| `ft_lstiter` | Iterates through the list and applies a function to each node |
| `ft_lstmap` | Creates a new list by applying a function to each node |

---

## File Structure

```
libft/
├── libft.h             # All prototypes and the t_list struct
├── ft_is.c             # Character classification functions
├── ft_str.c            # Core string functions
├── ft_str2.c           # Additional string functions
├── ft_str3.c           # strmapi, striteri, fd output
├── ft_strtrim.c        # ft_strtrim
├── ft_split.c          # ft_split
├── ft_mem.c            # Memory functions
├── ft_alloc.c          # calloc, strdup, substr, strjoin
├── ft_itoa.c           # ft_itoa
├── ft_fds.c            # putchar_fd, putstr_fd, putendl_fd, putnbr_fd
├── ft_utils.c          # Helper functions
├── ft_lstnew_bonus.c   # Linked list — creation
├── ft_lstfree_bonus.c  # Linked list — deletion / clearing
└── Makefile
```

---

## Compilation

```bash
make          # Build libft.a (mandatory)
make bonus    # Build libft.a with linked list functions
make clean    # Remove object files
make fclean   # Remove object files and libft.a
make re       # Full rebuild
```

## Usage

```bash
# Link libft.a when compiling your project
cc -Wall -Wextra -Werror main.c -L. -lft -o my_program
```

```c
#include "libft.h"

int main(void)
{
    char    *s = ft_strjoin("Hello, ", "world!");
    ft_putendl_fd(s, 1);
    free(s);
    return 0;
}
```

---

## Resources

- [man 3 string — Linux man pages](https://man7.org/linux/man-pages/man3/string.3.html)
- [man 3 mem — memset, memcpy, memmove...](https://man7.org/linux/man-pages/man3/memset.3.html)
- [GNU C Library documentation](https://www.gnu.org/software/libc/manual/html_node/index.html)

---

*This project was created as part of the 42 curriculum by Kheldin Acherchour.*
