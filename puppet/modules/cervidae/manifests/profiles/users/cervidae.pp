#
# A simple class for managing a user
#
class cervidae::profiles::users::cervidae {

  accounts::user { 'cervidae':
    ensure        => present,
    password      => '!!',
    comment       => 'Cervidae Service Account',
    purge_sshkeys => true,
    managehome    => true,
  }

}
