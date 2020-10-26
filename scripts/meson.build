project('<++>', 'cpp',
	version : '0.1',
	license : 'MIT',
	default_options : ['cpp_std=c++2a', 'buildtype=debugoptimized', 'warning_level=3',
					   'b_lto=true', 'cpp_rtti=false', 'cpp_eh=none'])

srcs = ['src/Main.cpp']

compiler_args = ['-Wformat-overflow=2', '-Wpedantic', '-Wshadow', '-Wmissing-include-dirs',
'-Wuninitialized', '-Wduplicated-branches', '-Wduplicated-cond', '-Wfloat-equal',
'-Wconversion', '-Wcast-qual', '-Wmissing-declarations']

includes = include_directories('include')

fmt = dependency('fmt')

exe = executable('<++>', sources: srcs, dependencies: [fmt], include_directories:
includes, cpp_args: compiler_args)

test('Simple Test', exe)

