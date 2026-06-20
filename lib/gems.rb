# frozen_string_literal: true

class Gems
  attr_reader :gems, :exit_code

  def initialize(gems, exit_code)
    @gems = gems
    @exit_code = exit_code
  end
end