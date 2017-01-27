#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
	#pragma omp parallel
	{
		int thread_id;
		thread_id = omp_get_thread_num();
		printf("Hello World from thread %d\n", thread_id);

		#pragma omp barrier
		if (thread_id == 0) {
			printf("total number of threads %d\n", omp_get_num_threads());
		}
	}
	return 0;
}
