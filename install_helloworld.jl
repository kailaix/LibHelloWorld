using ADCME

PWD = pwd()
change_directory(ADCME.PREFIXDIR)
git_repository("https://github.com/kailaix/LibHelloWorld", "LibHelloWorld")
change_directory("LibHelloWorld")
make_directory("build")
change_directory("build")
lib = get_library("hello_world")
require_file(lib) do 
    ADCME.cmake()
    ADCME.make()
end
_, libname = splitdir(lib)
mv(lib, joinpath(ADCME.LIBDIR, libname))
change_directory(PWD)