project('<++>', 'cpp',
	version : '0.1',
	license : 'MIT',
	default_options : ['cpp_std=c++2a', 'buildtype=release', 'warning_level=3'])

srcs = ['src/<++>.cpp']'

compiler_args = ['-O3', '-std=c++2a', '-flto', '-Wall', '-Wextra', '-Wformat-overflow=2', '-Wpedantic', '-Wshadow', '-Wmissing-include-dirs', '-Wuninitialized', '-Wduplicated-branches', '-Wduplicated-cond', '-Wfloat-equal', '-Wconversion', '-Wcast-qual', '-Wmissing-declarations', '-fno-rtti', '-fno-exceptions']

includes = include_directories('include')

dep = dependency('fmt')

exe = executable('List-meson', sources: srcs, dependencies: dep, include_directories: includes, cpp_args: compiler_args)

test('Simple Test', exe)

