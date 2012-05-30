module SuperEnvy
  class Extender

    def initialize hash
      @hash = hash
      can_be_upgraded?
      create_methods!
    end

    private
    def can_be_upgraded?
      raise "This object is not a hash!" unless @hash.is_a? Hash
    end

    def create_methods!
      @hash.keys.map {|k| [k.to_s.gsub('-', '_').to_sym , k ] }.each do |name,original_key|
        add_methods(name, original_key)
      end
    end


    def method_missing name
      # has_*? methods are defined during object creation
      # so if it doesnt exist by now, it means that the key in hash
      # doesn't exist either, therfore - we can safely return false
      if name.match(/^has_(.*)\?$/)
        false
      else
        super
      end
    end

    private
    def add_methods name, key
      acc = proc do |&b|
        v = @hash.fetch key
        b ?  b.call(v) : v
      end
      def_meth name, &acc

      chk = proc do
        v = @hash.fetch key
        not (v.nil? or v.empty?)
      end

      def_meth :"#{name}?", &chk


      has = proc do
        @hash.key? key
      end

      def_meth :"has_#{name}?",&has
    end

    def def_meth name, &block
      self.class.send(:define_method, name, &block)
    end
  end
end
