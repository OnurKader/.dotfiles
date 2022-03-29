project('<++>', 'cpp',
	version : '0.0.1',
	license : 'MIT',
	default_options : ['cpp_std=c++20', 'buildtype=debugoptimized', 'warning_level=3'])

srcs = ['src/main.cpp']

compiler_args = ['-Wformat-overflow=2', '-Wshadow', '-Wuninitialized',
				 '-Wduplicated-branches', '-Wduplicated-cond', '-Wfloat-equal',
				 '-Wconversion', '-Wcast-qual', '-fmax-errors=2']

includes = include_directories('include')

fmt = dependency('fmt')

exe = executable('<++>', sources: srcs, dependencies: fmt, include_directories:
				 includes, cpp_args: compiler_args)

test('Simple Test', exe)

