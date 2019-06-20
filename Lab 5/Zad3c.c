#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "socketlib.h"

int main(int argc, char **argv) {
    fd_set readfds;
    char *hostname, *name, *message;
    int port, sd, i, max_sd;
    name = malloc(30);
    message = malloc(512);

    if (argc != 3) {
        fprintf(stderr, "usage: %s hostname port\n", argv[0]);
        exit(1);
    }

    hostname = argv[1];
    port = atoi(argv[2]);

    sd = request_tcp_connection(hostname, port);

    printf("Server connection established, provide your Nickname:\n");
    i = read(0, name, 30);
    write(sd, name, i);

    i = read(sd, message, 512);
    printf("Connected users:\n");
    write(1, message, i);

    printf("Receiving user and your message:\n");

    while (1) {
        FD_ZERO(&readfds);
        FD_SET(0, &readfds);
        FD_SET(sd, &readfds);
        max_sd = sd;

        select(max_sd + 1, &readfds, NULL, NULL, NULL);

        if (FD_ISSET(sd, &readfds)) {
            i = read(sd, message, 512);
            if (i != 0)
                printf("%s", message);
        } else if (FD_ISSET(0, &readfds)) {
            i = read(0, message, 512);
            if (i != 0)
                write(sd, message, i);
        }
    }
    return 0;
} 
