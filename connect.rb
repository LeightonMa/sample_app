require 'rubygems'
require 'mongo'

include Mongo

mongo_client = MongoClient.new
db = mongo_client.db("tutorial")
coll = db.collection("users")