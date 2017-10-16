require './Components/component.rb'
require './routine_holder.rb'
require 'forwardable'
class ScriptController<Component
	extend Forwardable
	delegate [:move, :stop, :shoot, :rotate, :rotate_left, :rotate_right, :destruct]=>:@object.ph
    #attr_accessor :x, :y, :speed, :angle
    def initialize(obj)
        super(obj)
    end;

    
end;        