# Class responsable to parser the firs argument (full name) 'First + Last' to
# first_name and last_name methods
module NameParser
  attr_reader :first_name, :last_name

  # It hooks an the initialize method to
  # add the first_name and last_name through
  # the first_name
  def self.included(base)
    base.class_eval do
      original_method = instance_method(:initialize)
      define_method(:initialize) do |*args, &block|
        original_method.bind(self).call(*args, &block)
        full_name = args[0].split(" ")
        @first_name = full_name.first
        @last_name = full_name.last
      end
    end
  end

end
