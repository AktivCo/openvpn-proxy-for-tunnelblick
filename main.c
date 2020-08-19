#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/types.h>
#include <unistd.h>
#include <limits.h>

int main(int argc, char* argv[])
{
       	int shift=0;
	int is_daemon=0;
	char* new_argv[ARG_MAX];

	char new_path[PATH_MAX];
       	new_path[0]=0;
	strcat(new_path, argv[0]);
	strcat(new_path, "_origin");
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
	
	pid_t pid = fork();
	if (!pid) execv(new_path, new_argv);
	if (is_daemon) return 0;

	int status;
	if (waitpid(pid, &status, 0) == -1) return -1;
	if (!WIFEXITED(status))	return -1;

	return WEXITSTATUS(status);
}
