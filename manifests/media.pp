# @api private 

# tasks to manage pkgsrc source media - downloads bundle, creates repo

class pkgsrc::media inherits pkgsrc {

  # we may need a user to hang onto these files
  ensure_resource(
    'user',
    $pkgsrc::build_user, 
    { ensure => present, group => $pkgsrc::build_group }
  )

  # create the spool directory and assign to the user
  file { $::pkgsrc::spool_dir:
    ensure => directory
#   owner => $pkgsrc::build_user,
#   group => $pkgsrc::build_group,
#   mode => 0755,
  }

  # download the archive
  archive { "${::pkgsrc::spool_dir}/${::pkgsrc::pkgsrc_media_file}":
    checksum        => $::pkgsrc::pkgsrc_media_checksum,
    checksum_type   => $::pkgsrc::pkgsrc_media_checksum_type,
    cleanup         => false,
    creates         => "${::pkgsrc::spool_dir}/.done-extract",
    ensure          => present,
    extract_command => "tar -jxf %s && touch ${::pkgsrc::spool_dir}/.done-extract",
    extract_path    => $::pkgsrc::extract_dir,
    extract         => true,
    source          => "${::pkgsrc::pkgsrc_media_host}/${::pkgsrc::pkgsrc_media_path}/${::pkgsrc::pkgsrc_media_file}",
    user            => $pkgsrc::build_user
  }

}

