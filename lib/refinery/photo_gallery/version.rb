module Refinery
  module PhotoGallery
    class Version
      @major = 0
      @minor = 3
      @tiny  = '0'

      class << self
        attr_reader :major, :minor, :tiny

        def to_s
          [@major, @minor, @tiny].compact.join('.')
        end
      end
    end
  end
end
