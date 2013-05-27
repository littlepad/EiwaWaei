require_relative "./eiwa"
require_relative "./waei"

case ARGV[0]
  when "eiwa"
    eiwa = Eiwa.new(ARGV[1])
    eiwa.search()

  when "waei"
    waei = Waei.new(ARGV[1])
    waei.search()

  else
    puts 'set dictionary "eiwa" or "waei"'

end
