#include "types.h"
#include "user.h"
#include "pstat.h"

int main(int argc, char *argv[]) {
    
    if (atoi(argv[1]) > 0 && argc > 2 && argc < 10) { // argv[1] is loops
        int loops = atoi(argv[1]);
        printf(1, "\n\nLOOPS: %d \n\n", loops);
        int processes[argc - 2];

        int i = 0;
        for (i = 0; i < argc - 2; ++i) {
            int tickets = atoi(argv[i + 2]);
            if (tickets < 10) {
                printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
                printf(1, "\tloops must be greater than 0\n");
                printf(1, "\ttickets must be greater than or equal to 10\n");
                printf(1, "\tup to 7 tickets can be provided\n");
                exit();
            }
            processes[i] = fork();
            if (processes[i] < 0) exit();
            else if (processes[i] == 0) {
                if (settickets(tickets) == -1) {
                    printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
                    printf(1, "\tloops must be greater than 0\n");
                    printf(1, "\ttickets must be greater than or equal to 10\n");
                    printf(1, "\tup to 7 tickets can be provided\n");
                    exit();
                }
                while (1);
            }   
        }

        i = 0;
        for (i = 0; i < loops; ++i) {
            ps();
            sleep(3);
        }

        i = 0;
        for (i = 0; i < argc - 2; ++i) {
            kill(processes[i]);
        }

        i = 0;
        for (i = 0; i < argc - 2; ++i) {
            wait();
        }
    }
    else {
        printf(1, "usage: schedtest loops tickets1 [ tickets2 ... ticketsN ]\n");
        printf(1, "\tloops must be greater than 0\n");
        printf(1, "\ttickets must be greater than or equal to 10\n");
        printf(1, "\tup to 7 tickets can be provided\n");
    }
    
    exit();
}