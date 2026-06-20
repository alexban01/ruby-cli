# frozen_string_literal: true

class ProgramResult
  attr_reader :gem_name, :gem_info, :exit_code

  def initialize(gem_name, gem_info, exit_code)
    @gem_name = gem_name
    @exit_code = exit_code
    @gem_info = gem_info
  end
end
