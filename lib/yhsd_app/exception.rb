module YhsdApp

  class MissingToken < Exception

    def initialize
      super('token is empty.')
    end
    
  end

  class MissingAppKey < Exception

    def initialize
      super('app key is empty.')
    end
    
  end

  class MissingScope < Exception

    def initialize
      super('scope is empty.')
    end
    
  end

  class MissingAppSecret < Exception

    def initialize
      super('app secret is empty.')
    end
    
  end

  class MissingURI < Exception
    def initialize
      super('url is empty.')
    end
  end

end