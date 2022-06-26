require 'byebug'
class SessionMapper

  def self.call(old_times, new_times)
    old_times = old_times.delete_if { |ot| ot[:state] == 'suspended' }
    { old_times[0] => new_times[0],
      old_times[1] => new_times[1],
      old_times[2] => new_times[2],
      old_times[3] => new_times[3],
      old_times[4] => old_times[4],
      old_times[5] => new_times[5]}
  end
end
