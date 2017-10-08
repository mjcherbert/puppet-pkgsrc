# pkgsrc
#
# Main pkgsrc class, includes all other classes.
#
# @param unprivileged [Optional[Boolean]] Enables build in unprivileged mode. Default value: undef

class pkgsrc (
  Boolean $unprivileged,
) {

  contain pkgsrc::media
  contain pkgsrc::bootstrap
  contain pkgsrc::build
  contain pkgsrc::publish

  Class['::pkgsrc::media']
  -> Class['::pkgsrc::bootstrap']
  -> Class['::pkgsrc::build']
  ~> Class['::pkgsrc::publish']

}
