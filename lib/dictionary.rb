# coding: utf-8
#
#Copyright:: Copyright (c) kyow, 2010
#Authors:: K.Nishi

#
#
#
module TfIdf
  class Dictionary
    def initialize
      @map = {}
    end
  
    def set(k, v)
      @map[k] = v
    end
  
    def get(k)
      return @map[k]
    end
  
    def all
      return @map
    end
  
    def exists?(k)
      return @map.key?(k)
    end
  end
  
  class DFs < Dictionary
  end

  class IDFs < Dictionary
    attr_accessor :size
    attr_accessor :average
  end
end
