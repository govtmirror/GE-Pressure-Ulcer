/* File : pressure_ulcer.i */
/* %module(package="gevxl.pressure_ulcer",directors="1") pressure_ulcer */
/* %feature("director") pu_prevention_database_writer; */
%module(package="gevxl.pressure_ulcer") pressure_ulcer
%{
#include <vbl/vbl_shared_pointer.h>
#include <vcl_compiler.h>
#include <framework/chaining_process.h>
#include <vid/ffmpeg_frame_process.h>
#include <vid/external_frame_process.h>
#include <process_graph/data_type.h>

#include <pressure_ulcer/pu_camera_source_proc.h>

#include <pressure_ulcer/prevention/pu_prv_rectify_kinect_process.h>
#include <pressure_ulcer/prevention/pu_prv_motion_estimate_process.h>
#include <pressure_ulcer/prevention/pu_prevention_chaining_process.h>
/* #include <pressure_ulcer/prevention/pu_prevention_database_writer.h> */
#include <pressure_ulcer/assessment/pu_assessment_system_proc.h>
#include <pressure_ulcer/assessment/biochemical/biochemical_sensor.h>

using namespace gevxl::vid;
using namespace gevxl::pressure_ulcer;
using namespace gevxl::util::time;
%}     
            
%import(package="vxl") vil.i
%import(package="vxl") vcl.i
/* new additions */
#include <vcl_complex.h>
%include "std_complex.i"
#define vcl_complex std::complex
namespace std {
   %template(vcl_vector_complex) vector<vcl_complex<double> >;
};
/* */
%include <vnl_typemaps.i>
%import(package="gevxl") framework.i
%import(package="gevxl") img.i
%import(package="gevxl") vid.i
  
%include <pressure_ulcer/pu_camera_source_proc.h>

%include <pressure_ulcer/prevention/pu_prv_rectify_kinect_process.h>
%include <pressure_ulcer/prevention/pu_prv_motion_estimate_process.h>
%include <pressure_ulcer/prevention/pu_prevention_chaining_process.h>
/* %include <pressure_ulcer/prevention/pu_prevention_database_writer.h> */
%include <pressure_ulcer/assessment/pu_assessment_system_proc.h>
%include <pressure_ulcer/assessment/biochemical/biochemical_sensor.h>
