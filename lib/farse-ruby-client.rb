# -*- encoding : utf-8 -*-
## ----------------------------------------------------------------------
##
## Ruby client for Parse
## A quick library for playing with parse.com's REST API for object storage.
## See https://parse.com/docs/rest for full documentation on the API.
##
## ----------------------------------------------------------------------
require 'rubygems'
require 'bundler/setup'

require 'faraday'
require 'faraday_middleware'
require 'faraday/better_retry'
require 'faraday/extended_parse_json'
require 'faraday/get_method_override'
require 'date'
require 'cgi'

cwd = Pathname(__FILE__).dirname
$:.unshift(cwd.to_s) unless $:.include?(cwd.to_s) || $:.include?(cwd.expand_path.to_s)

require 'farse/object'
require 'farse/query'
require 'farse/datatypes'
require 'farse/util'
require 'farse/protocol'
require 'farse/user'
require "farse/installation"
require 'farse/push'
require 'farse/cloud'
require 'farse/model'
require 'farse/batch'
