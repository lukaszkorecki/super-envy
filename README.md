super-envy
==========

### It will make other programming languages envious when they see what you can do with environment variables


## SuperEnvy?

Nope, not this guy

![FMA envy](http://f.cl.ly/items/2n3m0O2v0A1x1N2T0r2B/Image%202012.04.29%2021:12:21.png)


## Super Envy makes it easy to work with environment variables

You'd probably use something like `optparse` or something else and suffer
the pain of  writting more code to bind data to variables inside your script
or app.

So you want to use env vars and get it done:
(example)

    $ names="joe stan todd" ruby names.rb
    $ "hello joe, stan, todd!"


```ruby
#!/usr/bin/env ruby
puts 'no names!' and exit 1 unless ENV['names']
puts "hello " + ENV['names'].split(' ').join(', ')
```

ugh... how about this?

    $ names_a="joe stan todd" ruby names.rb


and...

```ruby
#!/usr/bin/env ruby
require 'super-envy'
if ES.has_names?
  puts "hello " + SE.names.join(', ')
else
  puts 'no names!'
  exit 1
end

```
