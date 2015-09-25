class Event < ActiveRecord::Base
  def start=(datetime)
    super(DateTime.parse(datetime))
  end

  def finish=(datetime)
    super(DateTime.parse(datetime))
  end
end
