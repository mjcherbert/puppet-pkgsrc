# @api private 

# tasks to build the pkgsrc bootstrap

class pkgsrc::bootstrap inherits pkgsrc {

  notify { 'pkgsrc::bootstrap hello world': }

}
