require 'byebug'
class SessionMapper

  def self.call(old_times, new_times)
    { old_times.first => new_times.first }
  end
end
