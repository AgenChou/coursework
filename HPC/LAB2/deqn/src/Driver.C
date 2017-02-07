#include "Driver.h"

#include <omp.h>
#include <iostream>
#include <fstream>

    Driver::Driver(const InputFile* input, const std::string& pname)
: problem_name(pname)
{
    
   // Move to main:     
   // Redirecting logging to a file
//    std::ofstream out("out.txt", std::ofstream::ate);
  //  std::streambuf *coutbuf = std::cout.rdbuf();
    //std::cout.rdbuf(out.rdbuf());

    std::cout << "+++++++++++++++++++++" << std::endl;
    std::cout << "  Running deqn v0.1  " << std::endl;
#ifdef DEBUG
    std::cout << "- input file: " << problem_name << std::endl;
#endif

    dt_max = input->getDouble("dt_max",  0.2);
    dt = input->getDouble("initial_dt", 0.2);

    t_start = input->getDouble("start_time", 0.0);
    t_end = input->getDouble("end_time", 10.0);

    vis_frequency = input->getInt("vis_frequency",-1);
    summary_frequency = input->getInt("summary_frequency", 1);

#ifdef DEBUG
    std::cout << "- dt_max: " << dt_max << std::endl;
    std::cout << "- initial_dt: " << dt << std::endl;
    std::cout << "- start_time: " << t_start << std::endl;
    std::cout << "- end_time: " << t_end << std::endl;
    std::cout << "- vis_frequency: " << vis_frequency << std::endl;
    std::cout << "- summary_frequency: " << summary_frequency << std::endl;
    std::cout << "- number of threads: " << omp_get_num_threads() << std::endl;
#endif
    std::cout << "+++++++++++++++++++++" << std::endl;
    std::cout << std::endl;
    std::cout << "Creating mesh..." << std::endl;
    double start_time = omp_get_wtime();
    mesh = new Mesh(input);
    std::cout << "Time taken: " << omp_get_wtime() - start_time << std::endl;
    std::cout << std::endl;

    diffusion = new Diffusion(input, mesh);
    writer = new VtkWriter(pname, mesh);

    /* Initial mesh dump */
    if(vis_frequency != -1)
        writer->write(0, 0.0);
}

Driver::~Driver() {
    delete mesh;
    delete diffusion;
    delete writer;
}

void Driver::run() {
    double start_time = omp_get_wtime();
    int step = 0;
    double t_current;
    for(t_current = t_start; t_current < t_end; t_current += dt) {
        step = t_current/dt + 1;

        std::cout << "+ step: " << (int)step << ", dt:   " << (double)dt << std::endl;

        diffusion->doCycle(dt);

        if(step % vis_frequency == 0 && vis_frequency != -1)
            writer->write(step, t_current);
        if(step % summary_frequency == 0 && summary_frequency != -1) {
            double temperature = mesh->getTotalTemperature();
            std::cout << "+\tcurrent total temperature: " << temperature << std::endl;
        }
    }

    if(step % vis_frequency != 0 && vis_frequency != -1)
        writer->write(step, t_current);
    start_time = omp_get_wtime() - start_time;
    std::cout << std::endl;
    std::cout << "+++++++++++++++++++++" << std::endl;
    std::cout << "   Run completete.   " << std::endl;
    std::cout << "   Time: " << (double)start_time << std::endl;
    std::cout << "number of threads: " << omp_get_num_threads() << std::endl;
    std::cout << "+++++++++++++++++++++" << std::endl;
}
