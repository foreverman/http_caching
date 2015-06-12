# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment', __FILE__)
use Rack::Cache, verbose: true, 
  :metastore   => 'file:/Users/sean/workspace/http_caching/tmp/cache/rack/meta',
    :entitystore => 'file:/Users/sean/workspace/http_caching/tmp/cache/rack/body'
run Rails.application
