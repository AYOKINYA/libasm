/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: jkang <jkang@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/30 17:18:08 by jkang             #+#    #+#             */
/*   Updated: 2020/06/30 20:28:17 by jkang            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <string.h>

ssize_t ft_write(int fd, const void *buf, size_t count);
size_t  ft_strlen(const char *str);
char	*ft_strcpy(char *dest, const char *src);
int     ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s);

int main(void)
{
    char dest[50];
    char *a;
    char *b;
    char *c;

    printf("========ft_write=======\n");
    ft_write(1, "hello\n", 6);
    printf("========ft_strlen=======\n");
    printf("strlen is : %zu\n", ft_strlen("wow"));
    printf("========ft_strcpy=======\n");
    printf("%s\n", ft_strcpy(dest, "licorne"));
	printf("%s\n", ft_strcpy(dest, "aaa"));
	printf("%s\n", ft_strcpy(dest, "aa"));
	printf("%s\n", ft_strcpy(dest, ""));
    printf("========ft_strcmp=======\n");
    printf("%d\n", ft_strcmp("abc", "abc"));
    printf("%d\n", ft_strcmp("a", "b"));
	printf("%d\n", ft_strcmp("", "a"));
	printf("%d\n", ft_strcmp("aaaaa", "a"));
	printf("%d\n", ft_strcmp("a", "aaaaa"));
    printf("========ft_strdup=======\n");
    a = ft_strdup("hello");
    b = ft_strdup("strdup is done!");
    c = ft_strdup("");
    printf("'%s'\n", a);
	printf("'%s'\n", b));
	printf("'%s'\n", c);
    free(a);
    free(b);
    free(c);
    return (0);
}