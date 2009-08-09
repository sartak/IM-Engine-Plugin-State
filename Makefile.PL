use inc::Module::Install;

name     'IM-Engine-Plugin-State';
all_from 'lib/IM/Engine/Plugin/State.pm';
githubmeta;

requires 'IM::Engine' => 0.02;

tests('t/*.t t/*/*.t');

auto_install;
WriteAll;

