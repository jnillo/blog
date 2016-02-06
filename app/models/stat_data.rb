# Class to manage data of user visit
class StatData
  class << self
    include RedisStore

	def save_visit(date, ip)
	  store_hash(date, ip, 'Visits')
	end

	def visits(date_start, end_date = Time.zone.now)
	  date = date_start
	  visits = {}
	  loop do
        visits[date] = hash_value(date, 'Visits')
        date += 1.day
	  	break if date > end_date
	  end
	  visits
	end
  end
end