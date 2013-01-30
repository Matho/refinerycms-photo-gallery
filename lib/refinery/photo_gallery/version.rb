module Refinery
  module PhotoGallery
    class Version
      @major = 0
      @minor = 1
      @tiny  = '2'

      class << self
        attr_reader :major, :minor, :tiny

        def to_s
          [@major, @minor, @tiny].compact.join('.')
        end
      end
    end
  end
end
