project(
  'memo',
  ['vala', 'c'],
  version: '23.3',
  license: 'GPL-3.0',
  meson_version: '>= 0.59.0',
)

gnome = import('gnome')
i18n = import('i18n')

glib = dependency('glib-2.0')
gobject = dependency('gobject-2.0')
gmodule = dependency('gmodule-2.0')
gtk = dependency('gtk4')
gio = dependency('gio-2.0')
gee = dependency('gee-0.8')
libadwaita = dependency ('libadwaita-1')
gtksourceview = dependency('gtksourceview-5')

msgfmt = find_program('msgfmt')
podir = join_paths(meson.project_source_root(), 'po')

if get_option('profile') == 'development'
  name_prefix = '(Development) '
  profile = 'Devel'
else
  name_prefix = ''
  profile = ''
endif

app_id = 'io.github.daudix.Memo@0@'.format(profile)

conf = configuration_data()
conf.set_quoted('APP_ID', app_id)
conf.set_quoted('G_LOG_DOMAIN', 'io.github.daudix.Memo@0@'.format(profile))
conf.set_quoted('NAME_PREFIX', name_prefix)
conf.set_quoted('PACKAGE_NAME', meson.project_name())
conf.set_quoted('PACKAGE_VERSION', meson.project_version())
conf.set_quoted('PROFILE', profile)
conf.set_quoted('VERSION', meson.project_version())
conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
conf.set_quoted('DATADIR', join_paths(get_option('prefix'), get_option('datadir')))
conf.set_quoted('GNOMELOCALEDIR', join_paths(get_option('prefix'), get_option('localedir')))

configure_file(output: 'config.h', configuration: conf)
config_h_dir = include_directories('.')

subdir('data')
subdir('po')
subdir('src')
subdir('lib')
subdir('search-provider')

gnome.post_install(
  glib_compile_schemas: true,
  gtk_update_icon_cache: true,
  update_desktop_database: true
)
