module SuperEnvy
  class Extender

    def initialize hash
      @hash = hash
      @ok = proc { true }
      @nope = proc { false }
      can_be_upgraded?
      create_methods!
    end

    private
    def can_be_upgraded?
      raise "This object is not a hash!" unless @hash.is_a? Hash
    end

    def create_methods!
      @hash.keys.each do |name|
        add_methods name
      end
    end

    def method_missing name

      # has_*? methods are defined during object creation
      # but for unexisting keys we don't have them defined
      # lets cache them by dynamicaly attaching them to the instance and
      # make them return false
      if name.match(/^has_(.*)\?$/)
        def_meth name, &@nope
        def_meth name.to_s.sub('has_','').to_sym, &@nope

        self.send name
      else
        super
      end
    end

    private
    def add_methods name
      normalized_name, key = normalize_method_name(name), name
      acc = proc do |&b|
        v = @hash.fetch key
        b ?  b.call(v) : v
      end

      def_meth normalized_name, &acc

      chk = proc do
        v = @hash.fetch key
        is_nil = v.nil?
        if v.respond_to? :"empty?"
          is_empty = v.empty?
        else
          is_empty = false
        end
        !(is_nil or is_empty)
      end

      def_meth :"#{normalized_name}?", &chk



      def_meth :"has_#{normalized_name}?",&@ok
    end

    def normalize_method_name name
      name.to_s.downcase.gsub(/[ -]/, '_').to_sym
    end

    def def_meth name, &block
      self.class.send(:define_method, name, &block)
    end
  end
end
