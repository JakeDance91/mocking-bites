require "TimeError"

RSpec.describe TimeError do
  it "returns difference in seconds between server and PC" do
    requester_double = double :requester
    allow(requester_double).to receive(:get)
    .with(URI("https://worldtimeapi.org/api/ip"))
    .and_return('{"abbreviation":"GMT","client_ip":"2a00:23c6:ce8f:4d01:487d:e4bc:a5b0:2a75","datetime":"2022-03-18T15:16:38.837192+00:00","day_of_week":5,"day_of_year":77,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1647616598,"utc_datetime":"2022-03-18T15:16:38.837192+00:00","utc_offset":"+00:00","week_number":11}')
    
    time_error = TimeError.new(requester_double)
    fake_time = Time.new(2022,3,18,15,21,30)
    
    expect(time_error.error(fake_time)).to eq -291.162808
  end
end