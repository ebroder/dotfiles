require 'json'
default['chezmoi'] = JSON.load(IO.popen(['chezmoi', 'data'], in: :close).read)
