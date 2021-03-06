#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <limits.h>
#include <errno.h>

int main(int argc, char* argv[])
{
       	int shift=0;
	int is_daemon=0;
	char* new_argv[ARG_MAX];

	char new_path[PATH_MAX];
	new_path[0]=0;
	strcat(new_path, argv[0]);
	strcat(new_path, "_origin");
	ssize_t size=readlink(new_path, new_path, PATH_MAX);
	new_path[size]=0;
	new_argv[0] = new_path;

	for (int pos=1; pos < argc; ++pos) {
                if (pos-shift < 0) continue;
                if (!strcmp(argv[pos], "--daemon")) {
                        is_daemon=1;
			++shift;
                        continue;
                }
               
		new_argv[pos-shift] = argv[pos];
       	}
	
	argc=argc-shift;

	new_argv[argc] = 0;
	
	if (is_daemon) {
		pid_t pid = fork();
		if (!pid) execv(new_path, new_argv);

		usleep(500);

		int status;
		if (waitpid(pid, &status, WNOHANG) == 0) return 0;
		if (!WIFEXITED(status)) return -1;
		return WEXITSTATUS(status);
	} else {
		execv(new_path, new_argv);
		return 255;
	}
}
