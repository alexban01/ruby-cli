# frozen_string_literal: true

class GemData
  attr_reader :name, :info, :license, :downloads

  def initialize(name, info, license, downloads)
    @name = name
    @info = info
    @license = license
    @downloads = downloads
  end

  def get_license
    @license
  end
end
