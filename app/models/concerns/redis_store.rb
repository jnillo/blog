module RedisStore
  def all(table)
    datas = redis.smembers(table)
    datas.empty? ? datas : datas.map{|data| JSON.parse(data)}
  end
  
  def store(data, table)
    redis.sadd(table, data.to_json)
  end

  def destroy_all(table)
    redis.del(table)
  end

  def store_hash(key, data, table)
    data_stored = redis.hget(table, key)
    data_stored = data_stored.to_s + " #{data}"
    redis.hset(table, key, data_stored)
  end

  def hash_value(key, table)
    redis.hget(table, key).split
  end

  def destroy_hash(key, table)
    redis.hdel(table, key)
  end
  
  private
  
  def redis
    $redis
  end
end
