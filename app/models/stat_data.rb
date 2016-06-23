# Class to manage data of user visit
class StatData
  class << self
    include RedisStore

    def safe_share_post(post_id, ip, social_network)
      data = shares_post(post_id)
      if data.present? && data[social_network]
      	data[social_network] += [ip]
      elsif data.present?
      	data[social_network] = [ip]
      else
       	data = { social_network => [ip] }
      end
      destroy_hash(post_id, 'PostShare')
      store_hash(post_id, data.to_json, 'PostShare')
    end

    def shares_post(post_id)
      data = hash_value(post_id, 'PostShare')
      data ? JSON.parse(data.first) : {}
    end

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

	def save_visit_blog(ip, post_id)
	  store_hash(post_id, { Time.zone.now.to_i => ip }.to_json, 'PostVisit')
	end

	def visit_post(post_id)
	  visit_post_raw(post_id).count
	end

	def visit_post_raw(post_id)
	  data = hash_value(post_id, 'PostVisit')
      data ? data.map{ |data| eval data } : []
	end

	def visit_blog
      visit_blog_raw.count
	end

	def visit_blog_raw
      all('PostVisit')
	end
  end
end