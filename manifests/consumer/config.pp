define kafka::consumer::config(
  $config = ''
) {

  $consumer_config = deep_merge($config, $kafka::params::consumer_config_defaults)
  
  file { $name:
    ensure  => present,
    mode    => '0755',
    content => template('kafka/consumer.properties.erb'),
    require => File['/opt/kafka/conf']
  }
  
}