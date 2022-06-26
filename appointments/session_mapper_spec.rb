require 'rspec'
require_relative 'session_mapper'

RSpec.describe 'SessionMapper' do
  old_times = [
    {
    starts_at: '2021-06-23T09:00:00Z',
    ends_at: '2021-06-23T09:45:00Z',
    state: 'booked'
    },
    {
    starts_at: '2021-06-23T09:45:00Z',
    ends_at: '2021-06-23T10:30:00Z',
    state: 'suspended'
    },
    {
    starts_at: '2021-06-23T10:30:00Z',
    ends_at: '2021-06-23T11:15:00Z',
    state: 'booked'
    },
    {
    starts_at: '2021-06-23T11:15:00Z',
    ends_at: '2021-06-23T12:00:00Z',

    state: 'suspended'
    },
    {
    starts_at: '2021-06-23T13:30:00Z',
    ends_at: '2021-06-23T14:15:00Z',
    state: 'available'
    },
    {
    starts_at: '2021-06-23T14:15:00Z',
    ends_at: '2021-06-23T15:00:00Z',
    state: 'available'
    },
    {
    starts_at: '2021-06-23T15:00:00Z',
    ends_at: '2021-06-23T15:45:00Z',
    state: 'booked'
    },
    {
    starts_at: '2021-06-23T15:45:00Z',
    ends_at: '2021-06-23T16:30:00Z',
    state: 'booked'
    }
  ]

  new_times = [
    {
    starts_at: '2021-06-23T09:00:00Z',
    ends_at: '2021-06-23T09:50:00Z'
    },
    {
    starts_at: '2021-06-23T10:00:00Z',
    ends_at: '2021-06-23T10:50:00Z'
    },
    {
    starts_at: '2021-06-23T11:00:00Z',
    ends_at: '2021-06-23T11:50:00Z'
    },
    {
    starts_at: '2021-06-23T13:00:00Z',
    ends_at: '2021-06-23T13:50:00Z'
    },
    {
    starts_at: '2021-06-23T14:00:00Z',
    ends_at: '2021-06-23T14:50:00Z'
    },
    {
    starts_at: '2021-06-23T15:00:00Z',

    ends_at: '2021-06-23T15:50:00Z'
    }
  ]

  it 'returns the correct old time as the hash key' do
    result = SessionMapper.call(old_times, new_times)
    expect(result.keys.first).to eq(old_times.first)
  end

  it 'returns the correct new time as the hash value' do
    result = SessionMapper.call(old_times, new_times)
    expect(result.values.first).to eq(new_times.first)
  end

  it "removes 'suspended' sessions" do
    result = SessionMapper.call(old_times, new_times)
    expect(result.keys.filter{ | k | k[:state] == 'suspended'}).to be_empty
  end
end
