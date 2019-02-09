class SiforlatServices
  include HTTParty
  base_uri 'https://api.siforlat.com'

  def self.get_schedules(latitude, longitude, duration)
    response = get("/api/v1/prayTimes?latitude=#{latitude.to_f}&longitude=#{longitude.to_f}&duration=#{duration.to_i}", headers: {'Content-Type' => "application/json"})
    JSON.parse(response.body)
  end
  
end