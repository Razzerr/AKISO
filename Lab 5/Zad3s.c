#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include "socketlib.h"
#include <sys/time.h>

char *listOfUsers(char **users) {
    char *buffer;
    buffer = malloc(sizeof(char) * 30 * 30);
    for (int i = 0; i < 900; i++) {
        buffer[i] = '\0';
    }
    int bufIndex = 0;
    for (int i = 0; i < 30; i++) {
        if (users[i] == NULL) {
            buffer[bufIndex] = '\0';
        } else {
            for (int j = 0; users[i][j]; j++) {
                buffer[bufIndex] = users[i][j];
                bufIndex++;
            }
            buffer[bufIndex] = '\n';
            bufIndex++;
        }
    }
    buffer[bufIndex] = '\n';
    return buffer;
}

int getUsername(char *message, char *username) {
    int i;
    for (i = 0; message[i]; i++) {
        if ((message[i] == ' ') || (message[i] == '\n')) {
            username[i] = '\0';
            i++;
            break;
        } else {
            username[i] = message[i];
        }
        if (i == strlen(message) - 1)
            username[i + 1] = '\0';
    }
    return i;
}

char *nonEmptyMessage(char *string) {
    char *p = string;
    while (*p) {
        if (*p == ' ') {
            p++;
            return p;
        } else
            p++;
    }
    return NULL;
}

int arraySize(char *array) {
    int i = 0;
    while (array[i]) {
        i++;
    }
    return i;
}

int main(int argc, char **argv) {
    fd_set readfds;
    char *hostname;
    int max_clients = 32;
    int port, sd, max_sd, new_socket, master_socket, sockets[max_clients];
    char **users, *message, *buffer;

    buffer = malloc(512);
    users = malloc(sizeof(char *) * max_clients);

    for (int i = 0; i < max_clients; i++) {
        users[i] = NULL;
        sockets[i] = 0;
    }

    if (argc != 3) {
        fprintf(stderr, "usage: %s hostname port\n", argv[0]);
        exit(1);
    }

    hostname = argv[1];
    port = atoi(argv[2]);
    master_socket = server_tcp_socket(hostname, port);

    printf("Server established, awaiting connections\n");

    while (1) {
        FD_ZERO(&readfds);
        FD_SET(master_socket, &readfds);
        max_sd = master_socket;

        for (int i = 0; i < max_clients; i++) {
            sd = sockets[i];
            if (sd > 0)
                FD_SET(sd, &readfds);
            if (sd > max_sd)
                max_sd = sd;
        }

        select(max_sd + 1, &readfds, NULL, NULL, NULL);

        if (FD_ISSET(master_socket, &readfds)) {
            new_socket = accept_tcp_connection(master_socket);

            printf("New connection\n");

            for (int i = 0; i < max_clients; i++) {
                if (sockets[i] == 0) {
                    sockets[i] = new_socket;
                    sd = sockets[i];
                    users[i] = malloc(30);
                    char *tmp = malloc(30);
                    for (int n = 0; n < 30; n++) {
                        tmp[n] = '\0';
                    }
                    read(sd, tmp, 30);
                    tmp[arraySize(tmp) - 1] = '\0';
                    strcpy(users[i], tmp);
                    free(tmp);

                    message = listOfUsers(users);
                    write(sd, message, strlen(message) + 1);
                    free(message);
                    break;
                }
            }
        }

        for (int i = 0; i < max_clients; i++) {
            int length;
            sd = sockets[i];
            if (FD_ISSET(sd, &readfds)) {
                if ((length = read(sd, buffer, 512)) == 0) {
                    printf("A client has disconnected\n");
                    close(sd);
                    sockets[i] = 0;
                    users[i] = NULL;
                } else {
                    int userNotFound = 1;
                    buffer[length] = '\0';
                    char *name;
                    name = malloc(30);
                    getUsername(buffer, name);
                    for (int j = 0; j < max_clients; j++) {
                        if (users[j] != NULL && strcmp(users[j], name) == 0) {
                            if ((message = nonEmptyMessage(buffer)) == NULL) {
                                printf("Brak wiadomosci, blad\n");
                                userNotFound = 0;
                                break;
                            }
                            char *finmessage;
                            finmessage = malloc(544);
                            strcpy(finmessage, users[i]);
                            strcat(finmessage, ": ");
                            strcat(finmessage, message);

                            write(sockets[j], finmessage, strlen(message)+32);
                            free(finmessage);

                            userNotFound = 0;
                            break;
                        }
                    }
                    free(name);
                    if (userNotFound == 1) {
                        char *errormsg = "User not found\n";
                        write(sd, errormsg, strlen(errormsg) + 1);
                        write(1, errormsg, strlen(errormsg) + 1);
                    }
                }
                break;
            }
        }
    }
    return 0;
}

