vapi_sources = files(
  'config.vapi',
)

memo_vala_sources = files(
  'main.vala',
  'application.vala',
  'color.vala',
)

memo_sources = [
  lib_sources,
  vapi_sources,
  memo_vala_sources,
  resources
]

memo_vala_args = [
  '--target-glib', '2.72',
  '--vapidir', meson.current_source_dir(),
  '--gresources', resource_files,
]

memo_dependencies = [
  gee,
  gio,
  glib,
  gmodule,
  gobject,
  gtk,
  gtksourceview,
  libadwaita
]

subdir('ui')
generated_resources_dir = meson.current_build_dir()

memo_sources += gnome.compile_resources('memo-resources',
  'memo.gresource.xml',
  dependencies: blueprints,
  source_dir: ['src', generated_resources_dir],
  c_name: 'memo'
)

memo_sources += custom_target('blueprint-hack',
  input: blueprints,
  output: 'blueprint.vala',
  command: [find_program('touch'), '@OUTPUT@']
)


conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('VERSION', version)
conf.set_quoted('GNOMELOCALEDIR', get_option('prefix') / get_option('localedir'))
configure_file(output: 'config.h', configuration: conf)

cc = meson.get_compiler('c')
m_dep = cc.find_library('m', required: false)

executable('memo', memo_sources,
  vala_args: memo_vala_args,
  dependencies: memo_dependencies,
  install: true
)
