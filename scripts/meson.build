project('<++>', 'cpp',
	version : '0.1',
	license : 'MIT',
	default_options : ['cpp_std=c++2a', 'buildtype=debugoptimized', 'warning_level=3'])

srcs = ['src/<++>.cpp']

compiler_args = ['-flto', '-Wformat-overflow=2', '-Wpedantic', '-Wshadow', '-Wmissing-include-dirs', '-Wuninitialized', '-Wduplicated-branches', '-Wduplicated-cond', '-Wfloat-equal', '-Wconversion', '-Wcast-qual', '-Wmissing-declarations', '-fno-rtti', '-fno-exceptions']

includes = include_directories('include')

dep = dependency('fmt')

exe = executable('<++>', sources: srcs, dependencies: dep, include_directories: includes, cpp_args: compiler_args, cpp_pch: 'include/pch.hpp')

test('Simple Test', exe)

