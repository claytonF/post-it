# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
Post.create(
	[ #beginning of the Array
		{ #beginning of first hash (could use :title because these are symbols and put => between the key and the value instead of the :)
			:title => "How to use activeRecord",
			:body  => "By defining a model called Post, we have both a table called posts, and an activeRecord class available for inputting and retrieving values to and from the DB" 
		}, 
		{ # second hash
			title: "How to use DB seeds",
			body: "Use activeRecord in the seeds file and run 'rake db:seed' to populate the rows in the corresponding table with data."
		}
	]
)