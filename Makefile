##
## EPITECH PROJECT, 2018
## Nom_du_Projet
## File description:
## Makefile
##

NAME		=	libasm.so

ASM		=	nasm

ASMFLAGS	=	-f elf64

LD		=	ld

LDFLAGS		=	-shared

RM		=	rm -f

FILE		=	strlen.asm \
			strchr.asm \
			memset.asm \
			memcpy.asm \
			strcmp.asm \
			memmove.asm \
			strncmp.asm \
			strcasecmp.asm \
			rindex.asm \
			strstr.asm \
			strpbrk.asm \
			strcspn.asm

SRCD=	./src/

SRC		=	$(FILE)

OBJ		=	$(SRC:%.asm=$(SRCD)%.o)

$(SRCD)%.o:	$(SRCD)%.asm
	nasm -f elf64 -w+all $< -o $@

$(NAME):		$(OBJ)
			$(LD) $(LDFLAGS) $(OBJ) -o $(NAME)

all:			$(NAME)

clean:
			$(RM) $(OBJ)

fclean:			clean
			$(RM) $(NAME)

re:			fclean all

.PHONY: all clean fclean re