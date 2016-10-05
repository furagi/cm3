module Created
  module ClassMethods

  end

  module InstanceMethods
    def set_created
      self.created = Time.now
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
