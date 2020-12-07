     
require 'sinatra'
require 'sinatra/reloader' if development? 
require 'pry'
require 'pg'
require 'bcrypt'

enable :sessions

require_relative 'controllers/family_controller'
require_relative 'controllers/financial_controller'
require_relative 'controllers/quote_controller'
require_relative 'controllers/socialmedia_controller'
require_relative 'controllers/todo_controller'
require_relative  'controllers/users_controller'

require_relative 'models/user'
require_relative 'helpers/db_helper'















