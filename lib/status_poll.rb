class StatusPoll < EnumerateIt::Base
  associate_values :open  => 0,
                   :closed  => 1
end